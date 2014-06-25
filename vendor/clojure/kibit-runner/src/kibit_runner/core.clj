(ns kibit-runner.core
  (:require [kibit.check :refer [check-expr check-reader]]
            [clojure.java.io :refer [reader]]
            [clojure.data.json :as json])
  (:gen-class))

(defn- stringify-forms [r]
  (update-in (update-in r [:alt] pr-str)
             [:expr]
             str))

(defn -main
  [file]
  (let [results (or (check-reader (reader file))
                    '())]
    (println (json/write-str (map stringify-forms
                                  results)))))
