<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>디지털 리터러시 자가진단</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600&display=swap" rel="stylesheet" />
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<style>
  :root{
    --paper:#E7EAEE;
    --card:#FFFFFF;
    --ink:#15202B;
    --muted:#5A6675;
    --faint:#8A93A0;
    --line:#DBE0E6;
    --teal:#0E7C6B;
    --teal-deep:#0A5C50;
    --teal-soft:#E2F0EC;
    --amber:#F2A007;
    --navy:#12283D;
    --shadow:0 1px 2px rgba(18,40,61,.06),0 8px 24px rgba(18,40,61,.06);
  }
  *{box-sizing:border-box;}
  html{-webkit-text-size-adjust:100%;}
  body{
    margin:0;
    font-family:"Pretendard",system-ui,-apple-system,sans-serif;
    background:var(--paper);
    color:var(--ink);
    line-height:1.55;
    -webkit-font-smoothing:antialiased;
  }
  .wrap{max-width:680px;margin:0 auto;padding:0 18px 120px;}

  /* ---------- Header ---------- */
  header{padding:38px 0 18px;}
  .eyebrow{
    font-size:12px;letter-spacing:.18em;text-transform:uppercase;
    color:var(--teal);font-weight:700;margin:0 0 10px;
    display:flex;align-items:center;gap:9px;
  }
  .eyebrow::before{
    content:"";width:26px;height:2px;background:var(--teal);display:inline-block;
  }
  h1{
    font-size:clamp(28px,7vw,40px);line-height:1.12;margin:0 0 12px;
    letter-spacing:-.02em;font-weight:800;
  }
  .lede{color:var(--muted);font-size:15px;margin:0;max-width:48ch;}
  .meta{
    display:flex;gap:18px;flex-wrap:wrap;margin-top:18px;
    font-size:13px;color:var(--muted);
  }
  .meta b{color:var(--ink);font-weight:700;}

  /* ---------- Sticky gauge ---------- */
  .gauge{
    position:sticky;top:0;z-index:30;
    background:rgba(231,234,238,.86);backdrop-filter:blur(10px);
    border-bottom:1px solid var(--line);
    margin:0 -18px;padding:12px 18px;
  }
  .gauge-inner{max-width:680px;margin:0 auto;display:flex;align-items:center;gap:14px;}
  .readout{
    font-family:"IBM Plex Mono",monospace;font-weight:600;
    font-size:15px;color:var(--navy);white-space:nowrap;
    min-width:78px;
  }
  .readout span{color:var(--muted);font-size:12px;}
  .bar{
    position:relative;flex:1;height:9px;border-radius:99px;
    background:#CED5DC;overflow:hidden;
  }
  .bar-fill{
    position:absolute;inset:0;width:0%;border-radius:99px;
    background:linear-gradient(90deg,var(--teal),var(--amber));
    transition:width .45s cubic-bezier(.22,1,.36,1);
  }
  .count{
    font-family:"IBM Plex Mono",monospace;font-size:12px;color:var(--muted);
    white-space:nowrap;
  }
  .count b{color:var(--teal);}

  /* ---------- Legend ---------- */
  .legend{
    display:flex;justify-content:space-between;gap:8px;
    background:var(--card);border:1px solid var(--line);border-radius:14px;
    padding:12px 14px;margin:22px 0 8px;box-shadow:var(--shadow);
  }
  .legend div{text-align:center;flex:1;font-size:11px;color:var(--muted);line-height:1.3;}
  .legend .n{
    display:inline-flex;align-items:center;justify-content:center;
    width:22px;height:22px;border-radius:50%;background:var(--teal-soft);
    color:var(--teal-deep);font-weight:700;font-size:12px;margin-bottom:4px;
    font-family:"IBM Plex Mono",monospace;
  }

  /* ---------- Section ---------- */
  .section{margin-top:30px;}
  .section-head{display:flex;align-items:baseline;gap:10px;margin:0 2px 14px;}
  .section-no{
    font-family:"IBM Plex Mono",monospace;font-weight:600;font-size:13px;
    color:var(--amber);
  }
  .section-title{font-size:18px;font-weight:800;letter-spacing:-.01em;margin:0;}
  .section-count{font-size:12px;color:var(--faint);margin-left:auto;font-family:"IBM Plex Mono",monospace;}

  /* ---------- Question card ---------- */
  .q{
    background:var(--card);border:1px solid var(--line);border-radius:16px;
    padding:18px 18px 16px;margin-bottom:12px;box-shadow:var(--shadow);
    transition:border-color .2s;
  }
  .q.answered{border-color:var(--teal-soft);}
  .q-text{display:flex;gap:11px;margin-bottom:15px;}
  .q-num{
    font-family:"IBM Plex Mono",monospace;font-weight:600;font-size:13px;
    color:var(--teal);flex:none;padding-top:1px;
  }
  .q-body{font-size:15.5px;font-weight:500;letter-spacing:-.01em;}

  .scale{display:flex;gap:7px;}
  .opt{flex:1;}
  .opt input{position:absolute;opacity:0;width:0;height:0;}
  .opt label{
    display:flex;align-items:center;justify-content:center;
    height:46px;border-radius:12px;border:1.5px solid var(--line);
    background:#F8FAFB;cursor:pointer;font-family:"IBM Plex Mono",monospace;
    font-weight:600;font-size:15px;color:var(--muted);
    transition:transform .12s,background .15s,border-color .15s,color .15s;
    user-select:none;
  }
  .opt label:hover{border-color:var(--teal);color:var(--teal);}
  .opt label:active{transform:scale(.94);}
  .opt input:checked + label{
    background:var(--teal);border-color:var(--teal);color:#fff;
    box-shadow:0 4px 12px rgba(14,124,107,.28);
  }
  .opt input:focus-visible + label{outline:3px solid var(--amber);outline-offset:2px;}
  .ends{display:flex;justify-content:space-between;margin-top:8px;font-size:11px;color:var(--faint);}
  .chosen{
    margin-top:10px;font-size:12.5px;color:var(--teal-deep);font-weight:600;
    min-height:0;opacity:0;max-height:0;overflow:hidden;
    transition:opacity .2s,max-height .2s;
  }
  .chosen.show{opacity:1;max-height:24px;}

  /* ---------- Submit ---------- */
  .actions{margin-top:30px;display:flex;flex-direction:column;gap:10px;}
  .btn{
    border:none;border-radius:14px;font-family:inherit;font-weight:700;
    font-size:16px;padding:16px;cursor:pointer;transition:transform .12s,opacity .2s,background .2s;
    letter-spacing:-.01em;
  }
  .btn:active{transform:scale(.98);}
  .btn-primary{background:var(--navy);color:#fff;}
  .btn-primary:disabled{background:#B6BFC9;color:#EDF1F4;cursor:not-allowed;}
  .btn-ghost{background:transparent;color:var(--muted);border:1.5px solid var(--line);font-size:14px;padding:13px;}
  .hint{text-align:center;font-size:12.5px;color:var(--faint);margin:2px 0 0;}

  /* ---------- Result ---------- */
  .result{
    margin-top:26px;background:var(--navy);color:#EAF1F4;border-radius:20px;
    padding:28px 22px;display:none;box-shadow:0 14px 40px rgba(18,40,61,.22);
  }
  .result.show{display:block;animation:rise .5s cubic-bezier(.22,1,.36,1);}
  @keyframes rise{from{opacity:0;transform:translateY(16px);}to{opacity:1;transform:none;}}
  .result h2{margin:0 0 4px;font-size:14px;letter-spacing:.14em;text-transform:uppercase;color:#7FD8C8;font-weight:700;}
  .score-big{font-family:"IBM Plex Mono",monospace;font-weight:600;line-height:1;margin:6px 0 2px;}
  .score-big .pt{font-size:58px;}
  .score-big .max{font-size:24px;color:#7E9AAE;}
  .score-pct{font-family:"IBM Plex Mono",monospace;color:#9FB6C6;font-size:14px;margin-bottom:14px;}
  .tier{
    display:inline-block;background:rgba(242,160,7,.16);color:var(--amber);
    border:1px solid rgba(242,160,7,.4);border-radius:99px;
    padding:6px 14px;font-weight:700;font-size:14px;margin-bottom:18px;
  }
  .tier-desc{font-size:14px;color:#C6D4DD;margin:0 0 22px;}

  .breakdown{display:flex;flex-direction:column;gap:13px;border-top:1px solid rgba(255,255,255,.12);padding-top:20px;}
  .brow-top{display:flex;justify-content:space-between;align-items:baseline;font-size:13.5px;margin-bottom:6px;}
  .brow-top span:first-child{font-weight:600;color:#EAF1F4;}
  .brow-top span:last-child{font-family:"IBM Plex Mono",monospace;color:#9FB6C6;font-size:12.5px;}
  .btrack{height:7px;border-radius:99px;background:rgba(255,255,255,.12);overflow:hidden;}
  .bval{height:100%;border-radius:99px;background:linear-gradient(90deg,#22A38C,#7FD8C8);width:0;transition:width .8s cubic-bezier(.22,1,.36,1);}
  .bval.low{background:linear-gradient(90deg,#D9783F,var(--amber));}

  .tip{
    margin-top:22px;background:rgba(255,255,255,.07);border-radius:14px;padding:16px;
    border:1px solid rgba(255,255,255,.1);
  }
  .tip h3{margin:0 0 6px;font-size:13px;color:var(--amber);letter-spacing:.04em;}
  .tip p{margin:0;font-size:13.5px;color:#D2DEE6;line-height:1.6;}

  .result .btn-ghost{margin-top:22px;width:100%;color:#9FB6C6;border-color:rgba(255,255,255,.2);}
  .result .btn-ghost:hover{color:#fff;}

  @media (prefers-reduced-motion:reduce){
    *{transition:none!important;animation:none!important;}
  }
  @media print{
    .gauge,.actions,.legend{display:none;}
    body{background:#fff;}
    .q,.result{box-shadow:none;break-inside:avoid;}
  }
</style>
</head>
<body>
<div class="gauge" aria-hidden="true">
  <div class="gauge-inner">
    <div class="readout"><span id="liveScore">0</span> <span>/ 40</span></div>
    <div class="bar"><div class="bar-fill" id="barFill"></div></div>
    <div class="count"><b id="answered">0</b>/20</div>
  </div>
</div>

<div class="wrap">
  <header>
    <p class="eyebrow">디지털 리터러시 자가진단</p>
    <h1>나는 정보를<br>얼마나 비판적으로<br>읽고 있을까?</h1>
    <p class="lede">가짜뉴스·딥페이크·쇼츠·AI가 일상이 된 시대, 정보를 검증하고 깊이 읽는 나의 태도를 20개 문항으로 점검합니다. 정답은 없으니 평소 모습 그대로 답해 주세요.</p>
    <div class="meta">
      <div><b>20문항</b> · 6개 영역</div>
      <div>약 <b>5분</b> 소요</div>
      <div>총점 <b>40점</b></div>
    </div>
  </header>

  <div class="legend" aria-hidden="true">
    <div><span class="n">1</span>매우<br>그렇지 않다</div>
    <div><span class="n">2</span>그렇지<br>않다</div>
    <div><span class="n">3</span>보통<br>이다</div>
    <div><span class="n">4</span>그렇다</div>
    <div><span class="n">5</span>매우<br>그렇다</div>
  </div>

  <form id="survey"></form>

  <div class="actions">
    <button class="btn btn-primary" id="submitBtn" disabled>결과 보기</button>
    <p class="hint" id="hint">모든 문항에 답하면 결과를 볼 수 있어요.</p>
  </div>

  <div class="result" id="result" aria-live="polite">
    <h2>진단 결과</h2>
    <div class="score-big"><span class="pt" id="rScore">0</span><span class="max"> / 40</span></div>
    <div class="score-pct" id="rPct">0%</div>
    <div class="tier" id="rTier">—</div>
    <p class="tier-desc" id="rDesc"></p>
    <div class="breakdown" id="breakdown"></div>
    <div class="tip" id="tip">
      <h3 id="tipTitle">성장 포인트</h3>
      <p id="tipText"></p>
    </div>
    <button class="btn btn-ghost" id="resetBtn">다시 진단하기</button>
  </div>
</div>

<script>
const SECTIONS = [
  { title:"정보 검증·비판적 수용", q:[
    "충격적인 뉴스를 봐도 출처를 확인하기 전까지는 사실로 단정하지 않는다.",
    "정보를 찾을 때 한 곳만 보지 않고 여러 곳을 비교한다.",
    "통계나 수치를 볼 때 조사 기관과 시점을 확인하는 편이다.",
    "“[단독]”, “충격”, “전문가에 따르면” 같은 표현에 쉽게 휩쓸리지 않는다.",
    "기사에서 사실과 글쓴이의 의견을 구분하려고 한다."
  ], tip:"출처·작성자·날짜를 먼저 확인하고, 같은 사건을 다룬 다른 매체와 교차 비교하는 습관을 들여 보세요." },
  { title:"딥페이크·디지털 안보", q:[
    "영상이나 사진이 조작·합성된 것은 아닌지 의심해 보는 편이다.",
    "유명인이나 공인이 나온 영상이라도 출처가 불분명하면 그대로 믿지 않는다.",
    "가짜 영상이나 가짜뉴스가 사회 혼란을 일으킬 수 있다는 점을 인식하고 있다.",
    "진위가 확인되지 않은 정보는 다른 사람에게 공유하기 전에 한 번 더 검증한다."
  ], tip:"출처가 불분명한 영상·이미지는 사실로 단정하지 말고, 공유 전 진위를 한 번 더 확인하세요." },
  { title:"짧은 영상·집중력", q:[
    "짧은 영상(쇼츠 등)을 볼 때 정해 둔 시간을 지키며 절제하는 편이다.",
    "긴 글을 끝까지 집중해서 읽는 데 어려움이 없다.",
    "영상보다 글을 통해 정보를 얻는 것도 충분히 편하게 느낀다."
  ], tip:"쇼츠 시청 시간을 미리 정하고, 하루 한 편이라도 긴 글을 끝까지 읽어 보세요." },
  { title:"깊이 읽기·문해력", q:[
    "글을 읽을 때 훑어보기에 그치지 않고 핵심 주장과 근거를 정리하려 한다.",
    "화면으로 읽든 종이로 읽든 내용을 깊이 이해하려고 노력한다.",
    "모르는 단어나 개념이 나오면 넘어가지 않고 찾아본다."
  ], tip:"핵심 주장과 근거를 한 줄로 요약하며 읽고, 모르는 개념은 그때그때 찾아보세요." },
  { title:"AI 활용 태도", q:[
    "AI가 준 답변을 그대로 믿지 않고 사실인지 따로 확인한다.",
    "과제를 할 때 AI를 보조 도구로만 쓰고 내 생각으로 마무리한다.",
    "AI에 의존하기보다 스스로 정보를 정리하고 판단하려 한다."
  ], tip:"AI 답변은 출발점으로만 쓰고, 사실 여부를 직접 확인한 뒤 자기 생각으로 마무리하세요." },
  { title:"디지털 시민 의식", q:[
    "인터넷에 글이나 정보를 올릴 때 그 영향과 책임을 생각한다.",
    "다수의 의견이라도 근거가 부족하면 비판적으로 따져본다."
  ], tip:"게시물의 영향과 책임을 생각하고, 다수 의견이라도 근거를 따져보는 태도를 유지하세요." }
];

const POINTS = [0, 0.5, 1, 1.5, 2];
const LABELS = ["매우 그렇지 않다","그렇지 않다","보통이다","그렇다","매우 그렇다"];

const form = document.getElementById('survey');
let qIndex = 0;
const totalQ = SECTIONS.reduce((s,sec)=>s+sec.q.length,0);

SECTIONS.forEach((sec, si) => {
  const secEl = document.createElement('section');
  secEl.className = 'section';
  secEl.innerHTML = `
    <div class="section-head">
      <span class="section-no">${String(si+1).padStart(2,'0')}</span>
      <h2 class="section-title">${sec.title}</h2>
      <span class="section-count">${sec.q.length}문항</span>
    </div>`;
  sec.q.forEach((text) => {
    qIndex++;
    const qi = qIndex;
    const card = document.createElement('div');
    card.className = 'q';
    card.dataset.q = qi;
    card.dataset.section = si;
    let opts = '';
    for (let k=0;k<5;k++){
      opts += `<div class="opt">
        <input type="radio" id="q${qi}_${k}" name="q${qi}" value="${k}"
          aria-label="${qi}번 문항: ${LABELS[k]}">
        <label for="q${qi}_${k}">${k+1}</label>
      </div>`;
    }
    card.innerHTML = `
      <div class="q-text"><span class="q-num">Q${qi}</span><span class="q-body">${text}</span></div>
      <div class="scale">${opts}</div>
      <div class="ends"><span>매우 그렇지 않다</span><span>매우 그렇다</span></div>
      <div class="chosen" id="chosen${qi}"></div>`;
    secEl.appendChild(card);
  });
  form.appendChild(secEl);
});

const liveScore = document.getElementById('liveScore');
const barFill = document.getElementById('barFill');
const answeredEl = document.getElementById('answered');
const submitBtn = document.getElementById('submitBtn');
const hint = document.getElementById('hint');

form.addEventListener('change', (e) => {
  if (e.target.name && e.target.name.startsWith('q')) {
    const qi = e.target.name.slice(1);
    const k = +e.target.value;
    const chosen = document.getElementById('chosen'+qi);
    chosen.textContent = `선택: ${LABELS[k]} (${POINTS[k]}점)`;
    chosen.classList.add('show');
    e.target.closest('.q').classList.add('answered');
    update();
  }
});

function tally(){
  let total = 0, answered = 0;
  const secScores = SECTIONS.map(()=>0);
  SECTIONS.forEach((sec,si)=>{});
  document.querySelectorAll('.q').forEach(card=>{
    const qi = card.dataset.q;
    const sel = form.querySelector(`input[name="q${qi}"]:checked`);
    if (sel){
      answered++;
      const p = POINTS[+sel.value];
      total += p;
      secScores[+card.dataset.section] += p;
    }
  });
  return { total, answered, secScores };
}

function update(){
  const { total, answered } = tally();
  liveScore.textContent = Number.isInteger(total) ? total : total.toFixed(1);
  answeredEl.textContent = answered;
  barFill.style.width = (total/40*100) + '%';
  const done = answered === totalQ;
  submitBtn.disabled = !done;
  hint.textContent = done ? '준비 완료! 결과를 확인해 보세요.' : `${totalQ-answered}문항 남았어요.`;
}

const TIERS = [
  { min:32, name:"비판적·주체적 디지털 시민", desc:"정보를 의심하고 검증하며, AI와 미디어를 도구로 다루는 태도가 잘 잡혀 있습니다. 지금의 습관을 꾸준히 유지하세요." },
  { min:24, name:"건강한 디지털 습관, 한 걸음 더", desc:"전반적으로 비판적 태도를 갖췄습니다. 가장 약한 영역만 보완하면 한 단계 더 단단해집니다." },
  { min:16, name:"기본기는 있으나 보완 필요", desc:"방향은 맞지만 정보를 그대로 받아들이는 순간들이 있습니다. 검증과 깊이 읽기 습관을 의식적으로 늘려 보세요." },
  { min:0,  name:"디지털 리터러시 집중 보완", desc:"정보의 홍수에 휩쓸리기 쉬운 상태입니다. 출처 확인과 교차 비교부터 작은 습관으로 시작해 보세요." }
];

document.getElementById('submitBtn').addEventListener('click', () => {
  const { total, secScores } = tally();
  document.getElementById('rScore').textContent = Number.isInteger(total)?total:total.toFixed(1);
  document.getElementById('rPct').textContent = Math.round(total/40*100) + '% 달성';
  const tier = TIERS.find(t=>total>=t.min);
  document.getElementById('rTier').textContent = tier.name;
  document.getElementById('rDesc').textContent = tier.desc;

  const bd = document.getElementById('breakdown');
  bd.innerHTML = '';
  let weakest = {ratio:2, idx:0};
  SECTIONS.forEach((sec,si)=>{
    const max = sec.q.length*2;
    const val = secScores[si];
    const ratio = val/max;
    if (ratio < weakest.ratio){ weakest = {ratio, idx:si}; }
    const row = document.createElement('div');
    row.innerHTML = `
      <div class="brow-top"><span>${sec.title}</span><span>${Number.isInteger(val)?val:val.toFixed(1)} / ${max}</span></div>
      <div class="btrack"><div class="bval ${ratio<0.6?'low':''}"></div></div>`;
    bd.appendChild(row);
    requestAnimationFrame(()=>{ row.querySelector('.bval').style.width = (ratio*100)+'%'; });
  });

  document.getElementById('tipTitle').textContent = `성장 포인트 · ${SECTIONS[weakest.idx].title}`;
  document.getElementById('tipText').textContent = SECTIONS[weakest.idx].tip;

  const res = document.getElementById('result');
  res.classList.add('show');
  res.scrollIntoView({ behavior:'smooth', block:'start' });
});

document.getElementById('resetBtn').addEventListener('click', () => {
  form.reset();
  document.querySelectorAll('.chosen').forEach(c=>{c.textContent='';c.classList.remove('show');});
  document.querySelectorAll('.q').forEach(c=>c.classList.remove('answered'));
  document.getElementById('result').classList.remove('show');
  update();
  window.scrollTo({ top:0, behavior:'smooth' });
});

update();
</script>
</body>
</html>
