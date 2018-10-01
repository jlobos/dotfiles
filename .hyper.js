module.exports = {
  config: {
    updateChannel: 'canary',
    fontSize: 12,
    fontFamily: '"Fira Code", Menlo, monospace',
    fontWeight: 'normal',
    fontWeightBold: 'bold',
    cursorColor: '#EFF0EB',
    cursorAccentColor: '#000',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    foregroundColor: '#fff',
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
    selectionColor: 'rgba(0, 0, 0, 0.5)',
    borderColor: 'transparent',
    css: '',
    termCSS: '',
    showWindowControls: '',
    padding: '12px 14px',

    shell: '/bin/zsh',
    shellArgs: ['--login'],

    // for environment variables
    env: {
      // LANG: 'es_ES.UTF-8',
    },
    bell: 'false',

    copyOnSelect: false,
    defaultSSHApp: true,

    colors: {
      black: '#000000',
      red: '#ff5c57',
      green: '#5af78e',
      yellow: '#f3f99d',
      blue: '#57c7ff',
      magenta: '#ff6ac1',
      cyan: '#9aedfe',
      white: '#f1f2f0',
      lightBlack: '#686868',
      lightRed: '#ff5c57',
      lightGreen: '#5af78e',
      lightYellow: '#f3f99d',
      lightBlue: '#57c7ff',
      lightMagenta: '#ff6ac1',
      lightCyan: '#9aedfe',
      lightWhite: '#eff0eb',
    },

    hyperVibrance: {
      vibrancy: 'dark',
    },
  },

  plugins: ['hypercwd', 'hyper-vibrance'],
};
