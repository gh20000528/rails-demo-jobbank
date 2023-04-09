// Load all the channels within this directory and all subdirectories.
// // Channel files must be named *_channel.js.
// import { application } from "controllers/application"
// import { Application } from "stimulus"
// import { definitionsFromContext } from "stimulus/webpack-helpers"

// const application = Application.start()
// const context = require.context("controllers", true, /_controller\.js$/)
// application.load(definitionsFromContext(context))

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

