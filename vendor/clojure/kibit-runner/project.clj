(defproject kibit-runner "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [jonase/kibit "0.0.9-SNAPSHOT"]
                 [org.clojure/data.json "0.2.5"]]
  :main kibit-runner.core
  :profiles {:uberjar {:aot [kibit-runner.core]}})
