@font-face {font-family: 'Valken'; src: local('Valken'), url('/assets/fonts/valken.ttf') format('truetype');}

html {scroll-behavior: smooth;}
body {background: linear-gradient(135deg, #14a, #15d); overflow-x: hidden;}
main {padding-top: 0;}
footer {margin-top: 0;}
#welcome {background: $<body>[background];}

h2::before, h2::after {content: ""; display: block; width: 50%; height: 2px; margin-left: 25%; background: #fff; transition: 0.7s;}
h2:hover::before, h2:hover::after {width: 60%; margin-left: 20%;}
a[href]:hover {opacity: 1;}

.showcase-container {display: flex; height: 100vh; width: 100vw; border-top: 2px solid; text-align: center;}
    & div {margin: auto;}
    & p {max-width: 80%; margin: auto; font-size: 1.2em;}
    & img {max-width: 50%; filter: brightness(0) invert(1); font-size: 10.4vw; font-family: 'Valken';}
    & hr {width: 50%;}
    & h2 {font-size: 8vh;}
    & ul {padding-left: 0; list-style-type: none; font-size: 2.5em;}
    & li a {color: #eee;}
.image-background {background: fixed #333 center; background-blend-mode: overlay; background-size: cover;}

$(@breakpoint | 900px ||
    .content-container {display: flex;}
        & .title {width: 50vw;}
        & .contents {width: 40vw; text-align: left;}
)
