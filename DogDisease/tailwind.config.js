/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/webapp/WEB-INF/views/**/*.{html,js,jsp}"],
  theme: {
    extend: {},
  },
  plugins: [
	  require("tailwindcss"),
	  require("autoprefixer"),
  ],
}

