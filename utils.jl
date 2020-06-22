function hfun_add_redirects()
  basepath = Franklin.FOLDER_PATH[]
  for n in readdir(basepath)
    endswith(n, ".md") || continue
    n in ("index.md", "config.md") && continue
    name = splitext(n)[1]
    dst = joinpath(basepath, "__site", name * ".html")
    isfile(dst) && continue
    pre = ""
    prepath = globvar("prepath")
    if prepath === nothing
      pre = ""
    else
      pre = "/" * strip(prepath, '/')
    end
    s = """
    <!-- REDIRECT - DO NOT MODIFY-->
    <!doctype html>
    <html>
      <head>
        <meta http-equiv="refresh" content="0; url=$pre/$name/">
      </head>
    </html>
    """
    write(dst, s)
  end
  return ""
end
