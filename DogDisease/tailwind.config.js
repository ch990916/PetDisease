/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
	  "./src/**/*.{html,js,jsp}",
	  "./node_modules/flowbite/**/*.js"
	  ],
  theme: {
    extend: {},
  },
  plugins: [
	  require("tailwindcss"),
	  require("autoprefixer"),
	  require("flowbite/plugin")
  ],
}

