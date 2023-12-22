/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,jsp}",
	  "./src/main/WEB-INF/views/**/*.{html,jsp}"],
  theme: {
    extend: {
    },
  },
  plugins: [
	  require("tailwindcss"),
	  require("autoprefixer"),
  ],
}

