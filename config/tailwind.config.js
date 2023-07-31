const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  important: true,
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/**/*.{html.erb,erb,js,css}',
    './app/components/*.{html.erb,erb,js,css}',
    './app/components/**/*.{html.erb,erb,js,css}',
    './app/components/**/**/*.{html.erb,erb,js,css}',
    './app/helpers/*.rb',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
