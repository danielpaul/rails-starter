# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "alpinejs", to: "https://ga.jspm.io/npm:alpinejs@3.12.0/dist/module.esm.js"
pin "alpine-turbo-drive-adapter", to: "https://ga.jspm.io/npm:alpine-turbo-drive-adapter@2.0.0/dist/alpine-turbo-drive-adapter.esm.js"
pin "js-cookie", to: "https://ga.jspm.io/npm:js-cookie@3.0.5/dist/js.cookie.mjs"
pin "crypto-js", to: "https://ga.jspm.io/npm:crypto-js@4.1.1/index.js"
pin "crypto", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/crypto.js"
