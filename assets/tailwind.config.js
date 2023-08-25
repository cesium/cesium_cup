module.exports = {
    content: [
      "./js/**/*.js",
      "../lib/*_web.ex",
      "../lib/*_web/**/*.*ex"
    ],
    theme: {
      extend: {
        colors: {
          primary: "#080c25",
          secondary: "#161e35",
          tertiary: "#3071e7",
          quaternary: "#ffffff",
          quinary: "#a6b2ec",
          success: "#008F05",
          failure: "#FF4444",
          warning: "#E09200",
          win: "#5EFA5B",
          loss: "#FF0046",
          draw: "#E8EB53"
        },
        fontFamily: {
          montserrat: ["Montserrat"],
        },
      },
    },
    plugins: [require("@tailwindcss/forms")],
  };