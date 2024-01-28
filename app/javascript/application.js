// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import "bootstrap"

import { Dropdown, Ripple, initMDB } from "mdb-ui-kit";

initMDB({ Dropdown, Ripple });