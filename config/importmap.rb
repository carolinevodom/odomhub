# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "stimulus-autocomplete" # @3.1.0
pin "jquery" # @3.7.1
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "jquery-ui" # @1.14.1
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
