<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.sitemaps.org/schemas/sitemap/0.9"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="s xhtml">

  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"
      doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="robots" content="noindex, follow"/>
        <title>Sitemap XML &#8211; Garden Solution Mallorca</title>
        <style>
          :root{
            --bg:#f6f8f6; --card:#ffffff; --fg:#1c2b21; --muted:#5c6b60;
            --border:#dfe6e0; --head:#14532d; --head-fg:#ffffff;
            --row:#ffffff; --row-alt:#f0f5f1; --link:#15803d; --link-hover:#166534;
            --accent:#22c55e;
          }
          @media (prefers-color-scheme: dark){
            :root{
              --bg:#0e1512; --card:#141d18; --fg:#e7efe9; --muted:#9db0a3;
              --border:#26332b; --head:#166534; --head-fg:#f0fff5;
              --row:#141d18; --row-alt:#18231d; --link:#4ade80; --link-hover:#86efac;
              --accent:#22c55e;
            }
          }
          :root[data-theme="dark"]{
            --bg:#0e1512; --card:#141d18; --fg:#e7efe9; --muted:#9db0a3;
            --border:#26332b; --head:#166534; --head-fg:#f0fff5;
            --row:#141d18; --row-alt:#18231d; --link:#4ade80; --link-hover:#86efac;
          }
          :root[data-theme="light"]{
            --bg:#f6f8f6; --card:#ffffff; --fg:#1c2b21; --muted:#5c6b60;
            --border:#dfe6e0; --head:#14532d; --head-fg:#ffffff;
            --row:#ffffff; --row-alt:#f0f5f1; --link:#15803d; --link-hover:#166534;
          }
          *{box-sizing:border-box}
          body{
            margin:0; padding:0 16px 48px; background:var(--bg); color:var(--fg);
            font:15px/1.5 -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Helvetica,Arial,sans-serif;
          }
          .wrap{max-width:1080px; margin:0 auto}
          header{padding:28px 0 16px}
          h1{margin:0 0 6px; font-size:22px; font-weight:700; letter-spacing:-.01em}
          .sub{color:var(--muted); font-size:14px; margin:0}
          .bar{display:flex; flex-wrap:wrap; align-items:center; gap:12px; margin:14px 0 20px}
          .count{
            display:inline-block; background:var(--accent); color:#04150a;
            font-weight:600; font-size:13px; padding:4px 11px; border-radius:999px;
          }
          .back{color:var(--link); text-decoration:none; font-weight:600; font-size:14px}
          .back:hover{color:var(--link-hover); text-decoration:underline}
          .toggle{
            margin-left:auto; cursor:pointer; border:1px solid var(--border);
            background:var(--card); color:var(--fg); border-radius:8px;
            padding:6px 12px; font-size:13px; font-weight:600;
          }
          .card{
            background:var(--card); border:1px solid var(--border); border-radius:12px;
            overflow:hidden; box-shadow:0 1px 2px rgba(0,0,0,.04);
          }
          .scroll{overflow-x:auto}
          table{width:100%; border-collapse:collapse; font-size:14px}
          thead th{
            background:var(--head); color:var(--head-fg); text-align:left;
            padding:11px 14px; font-weight:600; white-space:nowrap; font-size:13px;
            letter-spacing:.02em;
          }
          tbody td{padding:10px 14px; border-top:1px solid var(--border); vertical-align:top}
          tbody tr:nth-child(odd){background:var(--row)}
          tbody tr:nth-child(even){background:var(--row-alt)}
          tbody tr:hover{background:rgba(34,197,94,.10)}
          td a{color:var(--link); text-decoration:none; word-break:break-all}
          td a:hover{color:var(--link-hover); text-decoration:underline}
          .num{color:var(--muted); text-align:right; white-space:nowrap; width:48px}
          .nowrap{white-space:nowrap; color:var(--muted)}
          .lang{
            display:inline-block; margin:1px 3px 1px 0; padding:1px 7px; font-size:11px;
            font-weight:600; border:1px solid var(--border); border-radius:6px; color:var(--muted);
          }
          footer{margin-top:22px; color:var(--muted); font-size:12.5px; text-align:center}
          footer a{color:var(--link); text-decoration:none}
        </style>
      </head>
      <body>
        <div class="wrap">
          <header>
            <h1>Sitemap XML</h1>
            <p class="sub">Garden Solution Mallorca &#8212; generado para motores de b&#250;squeda. Esta p&#225;gina se muestra como tabla; los buscadores leen el XML directamente.</p>
          </header>
          <xsl:apply-templates/>
          <footer>
            <p>Sitemap XML v&#225;lido &#183; <a href="https://mallorcagardensolution.com/">mallorcagardensolution.com</a></p>
          </footer>
        </div>
        <script>
          (function(){
            var root=document.documentElement;
            var btn=document.getElementById('themeToggle');
            if(!btn) return;
            function cur(){
              var t=root.getAttribute('data-theme');
              if(t) return t;
              return window.matchMedia &amp;&amp; window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark':'light';
            }
            function apply(t){ root.setAttribute('data-theme',t); btn.textContent = t==='dark' ? '☀️ Modo claro' : '\u{1F319} Modo oscuro'; }
            apply(cur());
            btn.addEventListener('click', function(){ apply(cur()==='dark'?'light':'dark'); });
          })();
        </script>
      </body>
    </html>
  </xsl:template>

  <!-- ===================== SITEMAP INDEX ===================== -->
  <xsl:template match="s:sitemapindex">
    <div class="bar">
      <span class="count"><xsl:value-of select="count(s:sitemap)"/> sub-sitemaps</span>
      <button type="button" id="themeToggle" class="toggle">Tema</button>
    </div>
    <div class="card">
      <div class="scroll">
        <table>
          <thead>
            <tr>
              <th class="num">#</th>
              <th>Sitemap</th>
              <th>&#218;ltima modificaci&#243;n</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="s:sitemap">
              <tr>
                <td class="num"><xsl:value-of select="position()"/></td>
                <td>
                  <a href="{s:loc}"><xsl:value-of select="s:loc"/></a>
                </td>
                <td class="nowrap">
                  <xsl:value-of select="substring(s:lastmod,1,10)"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
    </div>
  </xsl:template>

  <!-- ===================== URL SET ===================== -->
  <xsl:template match="s:urlset">
    <div class="bar">
      <a class="back" href="/sitemap.xml">&#8592; Volver al &#237;ndice</a>
      <span class="count"><xsl:value-of select="count(s:url)"/> URLs</span>
      <button type="button" id="themeToggle" class="toggle">Tema</button>
    </div>
    <div class="card">
      <div class="scroll">
        <table>
          <thead>
            <tr>
              <th class="num">#</th>
              <th>URL</th>
              <th>Idiomas alternos</th>
              <th>Frecuencia</th>
              <th>Prioridad</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="s:url">
              <tr>
                <td class="num"><xsl:value-of select="position()"/></td>
                <td>
                  <a href="{s:loc}"><xsl:value-of select="s:loc"/></a>
                </td>
                <td>
                  <xsl:for-each select="xhtml:link">
                    <span class="lang"><xsl:value-of select="@hreflang"/></span>
                  </xsl:for-each>
                </td>
                <td class="nowrap"><xsl:value-of select="s:changefreq"/></td>
                <td class="nowrap"><xsl:value-of select="s:priority"/></td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
