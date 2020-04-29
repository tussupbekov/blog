module.exports = {
    theme: {
        fontFamily: {
            'sans-serif': ['sans-serif'],
            'baloo-bhai-2': ['"Baloo Bhai 2"', 'cursive']
        },
        zIndex: {
            '-2': -2,
            '-1': -1,
            '0': 0,
            '1': 1,
            '2': 2
        },
        borderRadius: {
            'none': '0',
            'sm': '0.125rem',
            default: '0.25rem',
            'md': '0.375rem',
            'lg': '0.5rem',
            'full': '9999px',
            'xl': '1rem'
        },
        extend: {
            colors: {
                'theme-green': {
                    default: '#38D12E'
                },
                'theme-violet': {
                    default: '#C72ED1'
                }
            },
            spacing: {
                '1px': '1px',
                '1.5': '0.375rem',
                '22': '5.5rem',
                '96': '24rem',
                '80': '20rem',
                '144': '36rem',
                '192': '48rem'
            }
        },
        minWidth: {
            '64': '16rem',
            '80': '20rem',
            '96': '24rem'
        }
    },
    variants: {},
    plugins: []
};
