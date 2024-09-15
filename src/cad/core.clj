(ns cad.core
  (:require [clojure.java.io :refer [make-parents]]
            [scad-clj.scad :refer [write-scad]]
            [scad-clj.model :refer [cube union translate color difference
                                    sphere minkowski with-fn]])
  (:gen-class))

(defn degrees [n] (* n (/ Math/PI 180)))

(defn render!
  [file-name part]
  (let [file-path (str "out/" file-name ".scad")]
    (make-parents file-path)
    (spit file-path
          (write-scad part))))

(def default-config
  {:battery-body-x 17
   :battery-body-y 6
   :battery-body-z 65
   :battery-connector-x 3
   :battery-connector-y 4.7
   :battery-connector-z 5
   :box-battery-number-x 2
   :box-battery-number-y 3
   :box-battery-spacing 5
   :tpu-layer-z 6
   :tpu-layer-offset-from-top-of-battery-z 17
   :box-outside-radius 6
   :box-join-tol 0.15
   :strap-cut-x 10
   :strap-cut-z 2
   })


(defn config
  ([] (config {}))
  ([opts]
   (let [opts (merge default-config
                     opts)
         xs (+ (:battery-body-x opts) (:box-battery-spacing opts))
         ys (+ (:battery-body-y opts) (:box-battery-spacing opts))]

     (assoc opts
            :xs xs
            :ys ys
            :box-x (+ (* xs (:box-battery-number-x opts)) (:box-battery-spacing opts))
            :box-y (+ (* ys (:box-battery-number-y opts)) (:box-battery-spacing opts))
            :box-z (+ (:battery-body-z opts) (:battery-connector-z opts) (:box-battery-spacing opts))
            :tpu-layer-offset-z (- (:battery-body-z opts)
                                   (:tpu-layer-offset-from-top-of-battery-z opts)
                                   (:tpu-layer-z opts))

            ))))

(def gbn-550-1s
  (config))

(def gbn-300-1s
  (config {:battery-body-x 11.5
           :battery-body-y 7.5
           :battery-body-z 51
           :box-battery-number-x 5
           :box-battery-number-y 2
           :box-battery-spacing 5
           }))

(def tattu-300-1s
  (config {:battery-body-x 11.5
           :battery-body-y 7.5
           :battery-body-z 65
           :box-battery-number-x 5
           :box-battery-number-y 2
           :box-battery-spacing 5
           }))

(def gbn-550-3s
  (config {:battery-body-x 19
           :battery-body-y 17.7
           :battery-body-z 71
           :box-battery-number-x 2
           :box-battery-number-y 2
           :box-battery-spacing 8
           }))

(defn battery
  [{:keys [battery-body-x battery-body-y battery-body-z
           battery-connector-x battery-connector-y battery-connector-z
           ]}]
  (translate [(/ battery-body-x 2)
              (/ battery-body-y 2)
              (/ battery-body-z 2)
              ]
  (union
    (cube battery-body-x battery-body-y battery-body-z)
    (translate [0 0 (/ (+ battery-connector-z battery-body-z) 2)]
               (cube battery-connector-x battery-connector-y battery-connector-z))
    )))

(defn layout-grid
  [{:keys [xs ys box-battery-spacing box-battery-number-x
           box-battery-number-y]}
   model]

  (for [x (range box-battery-number-x) y (range box-battery-number-y)]
    (translate [(+ (* xs x) box-battery-spacing)
                (+ (* ys y) box-battery-spacing)
                0]
               model)))

(defn tpu-layer
  [{:keys [box-x box-y tpu-layer-z battery-body-x battery-body-y] :as config}]
  (difference
    (translate [(/ box-x 2)
                (/ box-y 2)
                (/ tpu-layer-z 2)]
               (cube box-x box-y tpu-layer-z))
    (layout-grid config
                 (translate [(/ battery-body-x 2) (/ battery-body-y 2) 0]
                            (cube battery-body-x battery-body-y 1000)))))

(defn box
  [{:keys [box-x box-y box-z box-outside-radius]}]
  (translate [(/ box-x 2) (/ box-y 2) (/ box-z 2)]
             (difference
             (minkowski
               (cube box-x box-y box-z)
               (with-fn 30
               (sphere box-outside-radius)))
             (cube box-x box-y box-z)
             )))


(defn box-bottom
  [{:keys [tpu-layer-offset-z tpu-layer-z
           box-x box-y box-outside-radius
           strap-cut-x strap-cut-z] :as config}]
  (let [d (/ box-outside-radius 2)
        xd (+ box-x d d)
        yd (+ box-y d d)

        offset (+ tpu-layer-offset-z tpu-layer-z)]
    (difference
      (box config)
      (union
        (translate [0 0 (+ 100 offset)]
                   (cube 200 200 200))

        (translate [(- (/  xd 2) d) (- (/  yd 2) d) (+ 100 offset)]
        (cube xd yd (+ 200 d d))))
      (translate [(/ box-x 2) 0 (- (/ strap-cut-z 2) box-outside-radius)]
                 (cube strap-cut-x 1000 strap-cut-z))
      )))


(defn box-top
  [{:keys [tpu-layer-offset-z tpu-layer-z
           box-x box-y box-outside-radius
           box-join-tol
           ] :as config}]
  (let [d (- (/ box-outside-radius 2) box-join-tol)
        xd (+ box-x d d)
        yd (+ box-y d d)
        offset (+ tpu-layer-offset-z tpu-layer-z)]
    (difference
      (box config)
        (translate [0 0 (+ -100 offset)]
                   (cube 200 200 200))

        (translate [(- (/  xd 2) d) (- (/  yd 2) d) (+ -100 offset d)]
                   (difference
                     (cube 300 300 200)
                     (cube xd yd 300)
                     )))))

(defn thing
  [config]
  [(layout-grid config
                (battery config))
   (color [0 0 1]
          (tpu-layer config))
   (color [0 0 1]
          (translate [0 0 (:tpu-layer-offset-z config)]
                     (tpu-layer config)))
   (color [1 0 0]
          (box-bottom config))
   (color [1 0 0]
          (translate [0 0 40]
                     (box-top config)))])


(render! "gbn-300-1s-tpu-layer" (tpu-layer gbn-300-1s))
(render! "gbn-300-1s-box-bottom" (box-bottom gbn-300-1s))
(render! "gbn-300-1s-box-top" (box-top gbn-300-1s))
(render! "gbn-300-1s-thing" (thing gbn-300-1s))


(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))
