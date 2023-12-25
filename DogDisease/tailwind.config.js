/** @type {import('tailwindcss').Config} */
module.exports = {
<<<<<<< HEAD
  content: ["./src/**/*.{html,jsp}",
	  "./src/main/WEB-INF/views/**/*.{html,jsp}"],
  theme: {
    extend: {
    },
=======
  content: [
	  "./src/**/*.{html,js,jsp}",
	  "./node_modules/flowbite/**/*.js"
	  ],
  theme: {
    extend: {},
>>>>>>> origin/branch_JinMyeong
  },
  plugins: [
	  require("tailwindcss"),
	  require("autoprefixer"),
<<<<<<< HEAD
=======
	  require("flowbite/plugin")
>>>>>>> origin/branch_JinMyeong
  ],
}

