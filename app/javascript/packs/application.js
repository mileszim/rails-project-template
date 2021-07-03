// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails, { formInputClickSelector } from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import * as ActionCable from "@rails/actioncable";

import "controllers"
import "channels"

// import "jquery3"
// import "popper"
// import "bootstrap"

import * as Sentry from "@sentry/browser";
import { Integrations } from "@sentry/tracing";
import ahoy from "ahoy.js";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
ActionCable.start();

// Sentry
Sentry.init({ 
  dsn: process.env.REACT_SENTRY_DSN,
  release: process.env.GIT_SHA || "",
  environment: process.env.NAMESPACE_ENV || process.env.RAILS_ENV || "development",
  integrations: [new Integrations.BrowserTracing()],
});
window.Sentry = Sentry;


// ahoy.js config
ahoy.configure({
  urlPrefix: "",
  visitsUrl: "/ahoy/visits",
  eventsUrl: "/ahoy/events",
  page: null,
  platform: "Web",
  useBeacon: true,
  startOnReady: true,
  trackVisits: true,
  cookies: true,
  cookieDomain: null,
  headers: {},
  visitParams: {},
  withCredentials: true,
  visitDuration: 4 * 60, // 4 hours
  visitorDuration: 2 * 365 * 24 * 60 // 2 years
});
window.ahoy = ahoy;


// Debugging
if (process.env.NAMESPACE_ENV || process.env.RAILS_ENV || "development") {
  ActionCable.logger.enabled = true;
  ahoy.debug(process.env.RAILS_ENV !== "production");
}