module.exports = {
  purge: ["./src/**/*.{js,jsx,ts,tsx}", "./public/index.html"],
  darkMode: "class", // or 'media' or 'class'
  theme: {
    extend: {
      fontSize: {
        tiny: ".65rem",
      },
      spacing: {
        13: "3.25rem",
        15: "3.75rem",
        112: "28rem",
        128: "32rem",
        144: "36rem",
        100: "100px",
        150: "150px",
        200: "200px",
        250: "250px",
        300: "300px",
        350: "350px",
        400: "400px",
        450: "450px",
        500: "500px",
        600: "600px",
        700: "700px",
        800: "800px",
        900: "900px",
        1000: "1000px",
      },
      colors: {
        "dark-primary": "#18191A",
        "dark-secondary": "#242526",
        "dark-third": "#3A3B3C",
        "dark-hover": "#454849",
        "dark-txt": "#B8BBBF",
      },
      maxWidth: {
        "1/4": "25%",
        "1/2": "50%",
        "2/3": "66.666667%",
        "2/5": "40%",
        "3/4": "75%",
        "1/12": "8.333333%",
        "2/12": "16.666667%",
        "3/12": "25%",
        "4/12": "33.333333%",
        "5/12": "41.666667%",
        "6/12": "50%",
        "7/12": "58.333333%",
        "8/12": "66.666667%",
        "9/12": "75%",
        "10/12": "83.333333%",
        "11/12": "91.666667%",
        70: "70px",
        100: "100px",
        150: "150px",
        200: "200px",
        250: "250px",
        300: "300px",
        350: "350px",
        400: "400px",
        450: "450px",
        500: "500px",
        600: "600px",
        700: "700px",
        800: "800px",
        900: "900px",
        1000: "1000px",
      },
      minWidth: {
        "1/4": "25%",
        "1/2": "50%",
        "2/3": "66.666667%",
        "2/5": "40%",
        "3/4": "75%",
        "1/12": "8.333333%",
        "2/12": "16.666667%",
        "3/12": "25%",
        "4/12": "33.333333%",
        "5/12": "41.666667%",
        "6/12": "50%",
        "7/12": "58.333333%",
        "8/12": "66.666667%",
        "9/12": "75%",
        "10/12": "83.333333%",
        "11/12": "91.666667%",
        70: "70px",
        100: "100px",
        150: "150px",
        200: "200px",
        250: "250px",
        300: "300px",
        350: "350px",
        400: "400px",
        450: "450px",
        500: "500px",
        600: "600px",
        700: "700px",
        800: "800px",
        900: "900px",
        1000: "1000px",
      },
      maxHeight: {
        "1/4": "25%",
        "1/2": "50%",
        "2/3": "66.666667%",
        "2/5": "40%",
        "3/4": "75%",
        "1/12": "8.333333%",
        "2/12": "16.666667%",
        "3/12": "25%",
        "4/12": "33.333333%",
        "5/12": "41.666667%",
        "6/12": "50%",
        "7/12": "58.333333%",
        "8/12": "66.666667%",
        "9/12": "75%",
        "10/12": "83.333333%",
        "11/12": "91.666667%",
        70: "70px",
        70: "70px",
        100: "100px",
        150: "150px",
        200: "200px",
        250: "250px",
        300: "300px",
        350: "350px",
        400: "400px",
        450: "450px",
        500: "500px",
        600: "600px",
        700: "700px",
        800: "800px",
        900: "900px",
        1000: "1000px",
      },
      minHeight: {
        "1/4": "25%",
        "1/2": "50%",
        "2/3": "66.666667%",
        "2/5": "40%",
        "3/4": "75%",
        "1/12": "8.333333%",
        "2/12": "16.666667%",
        "3/12": "25%",
        "4/12": "33.333333%",
        "5/12": "41.666667%",
        "6/12": "50%",
        "7/12": "58.333333%",
        "8/12": "66.666667%",
        "9/12": "75%",
        "10/12": "83.333333%",
        "11/12": "91.666667%",
        70: "70px",
        70: "70px",
        100: "100px",
        150: "150px",
        200: "200px",
        250: "250px",
        300: "300px",
        350: "350px",
        400: "400px",
        450: "450px",
        500: "500px",
        600: "600px",
        700: "700px",
        800: "800px",
        900: "900px",
        1000: "1000px",
      },
      animation: {
        zoomIn: "zoomIn 0.3s ease-in-out",
        swipeDown: "swipeDown 0.4s ease-in-out",
        swipeUp: "swipeUp 0.4s ease-in-out",
        popup: "popup 0.3s ease-in-out",
        fadeIn: "fadeIn 0.3s ease-in-out",
        fadeOut: "fadeOut 0.3s ease-in-out forwards",
        bounce200: "bounce 1s infinite 200ms",
        bounce400: "bounce 1s infinite 400ms",
      },
      keyframes: (theme) => ({
        fadeIn: {
          "0%": { opacity: 0 },
          "100%": { opacity: 1 },
        },
        fadeOut: {
          "0%": { opacity: 1 },
          "99%": { opacity: 0 },
          "100%": { display: "none", visibility: "hidden" },
        },
        swipeUp: {
          "0%": { opacity: 0, transform: "translateY(40%)" },
          "100%": { opacity: 1, transform: "translateY(0%)" },
        },
        swipeDown: {
          "0%": { opacity: 0, transform: "translateY(-40%)" },
          "100%": { opacity: 1, transform: "translateY(0%)" },
        },
        zoomIn: {
          "0%": { opacity: 0, transform: "scale(0%)" },
          "100%": { opacity: 1, transform: "scale(100%)" },
        },
        popup: {
          "0%": { transform: "scale(1)" },
          "50%": { transform: "scale(1.4)" },
          "60%": { transform: "scale(1.1)" },
          "70%": { transform: "scale(1.2)" },
          "80%": { transform: "scale(1)" },
          "90%": { transform: "scale(1.1)" },
          "100%": { transform: "scale(1)" },
        },
      }),
    },
    fontFamily: {
      title: ["Roboto", "Helvetica", "Arial", "sans-serif"],
      content: ["Nunito", "Roboto", "Helvetica", "Arial", "sans-serif"],
    },
  },
  variants: {
    gradientColorStops: ["active", "group-hover", "dark"],
    transform: ["responsive", "hover", "focus", "active", "group-hover"],
    scale: ["responsive", "hover", "focus", "active", "group-hover"],
    extend: {
      backgroundColor: ["active", "disabled"],
      opacity: ["disabled"],
      display: ["group-hover"],
    },
  },
  plugins: [],
};
