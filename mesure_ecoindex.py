import re, sys, urllib.request, gzip, zlib, html as H
from urllib.parse import urljoin
from collections import Counter
UA={'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/120 Safari/537.36',
    'Accept-Language':'fr-FR,fr;q=0.9,en;q=0.8'}
def get(url):
    h=dict(UA); h['Accept-Encoding']='gzip, deflate'
    try:
        with urllib.request.urlopen(urllib.request.Request(url,headers=h),timeout=25) as f:
            raw=f.read(); enc=f.headers.get('Content-Encoding','')
        b=raw
        if enc=='gzip': b=gzip.decompress(raw)
        elif enc=='deflate': b=zlib.decompress(raw,-15)
        return len(raw), b
    except Exception: return 0,b''
def eco(dom,n,ko):
    qd=[0,47,75,159,233,298,358,417,476,537,603,674,753,843,949,1076,1237,1459,1801,2479,5400]
    qr=[0,2,3,4,6,9,11,14,17,20,24,28,32,37,42,49,57,67,80,102,180]
    qp=[0,20,46,71,97,123,151,178,208,242,278,318,364,417,481,568,678,838,1119,1721,3000]
    def q(a,v):
        for i in range(1,len(a)):
            if v<a[i]: return i-1+(v-a[i-1])/(a[i]-a[i-1])
        return len(a)-1
    s=100-5*(3*q(qd,dom)+2*q(qr,n)+q(qp,ko))/6
    for t,l in [(80,'A'),(70,'B'),(55,'C'),(40,'D'),(25,'E'),(10,'F'),(0,'G')]:
        if s>=t: return round(s,1),l
def analyse(page,label):
    nh,body=get(page)
    if not nh: print(f"\n===== {label} ===== ECHEC ({page})"); return
    doc=body.decode('utf-8','replace')
    dom=len(re.findall(r'<([a-zA-Z][a-zA-Z0-9-]*)[\s/>]',doc))
    U=H.unescape; eager=set(); lazy=set()
    for tag in re.findall(r'<img[^>]*>',doc):
        m=re.search(r'src=(?:["\']([^"\']+)["\']|([^\s">]+))',tag)
        if not m: continue
        src=m.group(1) or m.group(2)
        if not src or src.startswith('data:'): continue
        isl = 'loading="lazy"' in tag or 'loading=lazy' in tag
        (lazy if isl else eager).add(U(src))
    lazy-=eager
    css={U(a or b) for a,b in re.findall(r'<link(?=[^>]*rel=["\']?stylesheet)[^>]*href=(?:["\']([^"\']+)["\']|([^\s">]+))',doc) if (a or b)}
    js ={U(a or b) for a,b in re.findall(r'<script[^>]+src=(?:["\']([^"\']+)["\']|([^\s">]+))',doc) if (a or b)}
    w=lambda s: sum(get(urljoin(page,u))[0] for u in s)
    wc,wj,we,wl=w(css),w(js),w(eager),w(lazy)
    fmt=Counter((re.search(r'\.([a-z0-9]+)(?:\?|$)',u.lower()) or [None,'?'])[1] for u in eager|lazy)
    ini=(nh+wc+wj+we)/1024; tot=ini+wl/1024
    ni=1+len(css)+len(js)+len(eager); nt=ni+len(lazy)
    s1,g1=eco(dom,ni,ini); s2,g2=eco(dom,nt,tot)
    print(f"\n===== {label} =====\n  {page}")
    print(f"  DOM ~{dom} | HTML {nh/1024:.0f} Ko | CSS {len(css)}={wc/1024:.0f} Ko | JS {len(js)}={wj/1024:.0f} Ko")
    print(f"  Images {len(eager)} imm. ({we/1024:.0f} Ko) + {len(lazy)} lazy ({wl/1024:.0f} Ko) | formats {dict(fmt)}")
    print(f"  >> INITIAL  : {ni:>3} req, {ini:>7.0f} Ko -> EcoIndex {s1:>5} = {g1}")
    print(f"  >> COMPLETE : {nt:>3} req, {tot:>7.0f} Ko -> EcoIndex {s2:>5} = {g2}")
if __name__=="__main__":
    for arg in sys.argv[1:]:
        u,l=arg.split("::"); analyse(u,l)
