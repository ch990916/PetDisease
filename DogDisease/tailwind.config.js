/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,jsp}"],
  theme: {
    extend: {},
  },
  plugins: [
	  require("tailwindcss"),
	  require("autoprefixer"),
	  require("flowbite/plugin")
  ],
}

