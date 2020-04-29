<#import 'components/navbar.ftlh' as navbar>
<#import 'components/footer.ftlh' as footer>
<#macro base_layout>
  <html lang="en">
  <head>
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/tailwind.css">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Bhai+2:wght@500&display=swap" rel="stylesheet">
  </head>
  <body>
  <div class="min-h-screen flex flex-col">
      <@navbar.navbar/>
    <div class="container mx-auto flex-grow relative">
        <#nested>
    </div>
      <@footer.footer/>
  </div>
  </body>
  </html>
</#macro>