const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  purge: {
    enabled: false,
    content: [
      './app/**/*.{html.erb,erb,js,css}',
      './app/components/*.{html.erb,erb,js,css}',
      './app/components/**/*.{html.erb,erb,js,css}',
      './app/components/**/**/*.{html.erb,erb,js,css}',
      './app/helpers/*.rb',
    ],
    options: {
      safelist: [
        'grid',
        'grid-cols-4',
        'grid-cols-7',
      ],
    },
  },
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
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
