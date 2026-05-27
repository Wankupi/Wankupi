#import "@preview/modernpro-cv:1.0.1": *
#import "@preview/fontawesome:0.5.0": *
#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold

#set page(paper: "us-letter")

#let link_bak = link
#let link = (url, text) => text
#let ICPC = link("https://icpc.global/", "国际大学生程序设计竞赛 (ICPC)")
#let CCPC = link("https://ccpc.io/", "中国大学生程序设计竞赛 (CCPC)")

#let link = link_bak
#let sjtu = link("https://en.sjtu.edu.cn/", "上海交通大学")
#let zhiyuan = link("https://en.zhiyuan.sjtu.edu.cn/", "致远学院")
#let acm = link("https://acm.sjtu.edu.cn/", "ACM班")

#let mit = "Massachusetts Institute of Technology"

#let weng = "翁惠玉"
#let liang = "梁阿磊"
#let yu = "俞勇"
#let guoxing = link("https://donnod.github.io/", underline(emph[陈国兴]))
#let mengjia = link("https://people.csail.mit.edu/mengjia/", underline(emph[Mengjia Yan]))

// #let theme_color = rgb("#005dc8")
// #let theme_color = rgb("#003572")
#let theme_color = black
#let hl_color = theme_color

#show strong: set text(fill: hl_color)

#show: cv-single.with(
  font-type: ("Times New Roman", "SimSun", "Noto Sans CJK SC"),
  continue-header: "false",
  name: [王鲲鹏],
  // address: [#acm, #sjtu],
  address: {},
  lastupdated: "true",
  pagecount: "false",
  date: datetime.today().display(),
  contacts: (
    (text: "kunpengwang@sjtu.edu.cn", link: "mailto:kunpengwang@sjtu.edu.cn"),
    (text: [#fa-icon("github")\. Wankupi], link: "https://www.github.com/Wankupi"),
    (text: [www.wankupi.top], link: "https://www.wankupi.top"),
    (text: [(+86) 15226606796], link: "tel:15226606796")
  ),
)

#let item(title, detail, short: "", date: "", extra: "", description: "", show_detail: true) = {
  show : it => block(it, breakable: false)
  oneline-two(
    entry1: {
      text(weight: "bold", fill: theme_color, title)
      if (short != "") {
        [, ]
        // text(style: "italic", short)
        short
      }
      if (extra != "" and extra != none) {
        [, ]
        text(style: "italic", extra)
      }
    },
    entry2: date,
  )
  if (description != "") {
    description
  }
  if (show_detail and detail != []) {
    block(inset: (left: 1em, right: 0em, top: -0.5em, bottom: -0.0em), text(size: 1em, detail))
  }
}

#let github(path) = link("https://github.com/" + path)[#fa-icon("github")]
#let gitee(path) = link(
  "https://gitee.com/" + path,
)[#box(image("gitee-logo.svg"), height: 1em, inset: (right: -0.4em, bottom: -0.1em, top: 0.05em))]
// #let github(path) = {}
// #let gitee(path) = {}


#section[教育经历]

#item(
  sjtu,
  date: [2022 年 9 月 \~ 2026 年 6 月],
  description: emph[计算机科学与技术 工学学士, #underline(acm)],
)[]

#item(
  mit,
  date: "2026 年秋",
  description: emph[EECS 博士（即将入学）],
)[]

#sectionsep

#section[发表论文]

#item(
  [Interplay of Efficient Model Checking and Secure Processor Design: A Case Study on Secure Speculation],
)[
  _IEEE S&P 2026_ \
  Tingzhen Dong\*, *Kunpeng Wang\**, Yuheng Yang, Yu-Wei Fan, Qinhan Tan, Thomas Bourgeat, Sharad Malik, Mengjia Yan
]

#sectionsep

#section[科研经历]

#item(
  link("https://github.com/MATCHA-MIT")[MATCHA Group],
  short: "MIT",
  date: "2025 年 5 月 ~ 2025 年 12 月",
  show_detail: true,
)[
  导师: #mengjia\
  研究方向: 安全（乱序）处理器设计与验证。

]

#item(
  link("https://nsec.sjtu.edu.cn/")[网络空间安全与隐私保护 (NSEC) 实验室],
  short: "上海交通大学",
  date: "2024 年 6 月 ~ 2026 年 6 月",
  show_detail: true,
)[
  导师: #guoxing\
  研究方向: 可信执行环境下基于中断的侧信道防御的可验证性。
]


#section[荣誉奖项]

#let award(award: "", institution: "", date: "", extra: "", description: "") = {
  item(award, short: institution, date: date, extra: extra, description: description)[]
}

#let award(award: [], inst: [], inst2: [], extra: "", date: "") = {
  let extra_text = {
    ", "
    text(style: "italic", extra)
  }
  oneline-two(entry1: text(weight: "bold", fill: theme_color, award), entry2: date)
  h(1em)
  inst
  if (inst2 == [] and extra != "") {
    extra_text
  }
  linebreak()
  if (inst2 != []) {
    h(1em)
    inst2
    if (extra != "") {
      extra_text
    }
    linebreak()
  }
}

#grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
)[
#award(
  award: [上海市优秀毕业生],
  date: "2026",
  inst: [#sjtu],
)
#award(award: "三好学生", date: "2023", inst: sjtu, extra: [每班仅一人])
#award(
  award: [华为奖学金],
  date: "2025",
  inst: [#sjtu],
)
#award(
  award: [金奖],
  date: "2022",
  inst: [#ICPC, 杭州],
)
#award(
  award: [金奖],
  date: "2022",
  inst: [#ICPC, 南京],
)
][
#award(
  award: [铜奖],
  date: "2022",
  inst: [#ICPC, 香港],
)
#award(award: "银奖", date: "2022", inst: [#CCPC, 威海])
#award(award: "致远荣誉奖学金", date: "2022, 2023, 2024", inst: zhiyuan, extra: [上海交大前 10%])
#award(award: "A 等优秀奖学金", date: "2023", inst: zhiyuan, extra: [班级前三])
]


#sectionsep

// ----- separate -----

#let item = item.with(show_detail: true)

#section[课程项目]

#item(
  [Verified TypeInfer],
  date: "2024 年春",
  extra: gitee("Wankupi/typeinfer"),
)[
  - 使用 Coq 验证 C 语言实现的类型推导算法的正确性。
  - 约 2000 行 Coq 代码。
]
#item(
  [Mx-Compiler],
  date: "2023 年夏",
  extra: github("Wankupi/MxCompiler"),
)[
  - 将 Mx 语言（课程设计的 C++ 变体）编译至 RISCV32IM 汇编的编译器。
  - 特性：图着色寄存器分配、Mem2Reg、常量传播等。
  - 约 15800 行 C++ 代码。
]
#item(
  [RISCV32I CPU],
  date: "2023 年秋",
  extra: github("Wankupi/RiSCV32-Processor"),
)[
  - 特性：Tomasulo 算法、分支预测、指令缓存等。
  - 在 Xilinx FPGA 开发板上测试通过。
  - 约 3300 行 Verilog 代码。
]
#item(
  [RISCV64 微内核],
  date: "2024 年春",
  extra: github("Wankupi/kernel"),
)[
  - 特性：KASLR、虚拟内存、Buddy 分配器、类 Unix 系统调用等。
  - 包含从引导加载程序到用户程序的完整栈代码。
  - 在真机 VisionFive2 上测试通过。
  - 约 3000 行 Rust 代码。
]

// #sectionsep

// #let item = item.with(show_detail: false)

#section[助教经历]

#let TA(class, teacher, date: "", extra: "", body) = {
  item(class, body, short: [#teacher], date: date, extra: extra)
}

#TA("程序设计实践", yu, date: "2024 年夏")[
  - 基于学生所学知识（程序设计、体系结构、密码学）设计 CTF 赛题。
  - 改进并优化课程大项目：RISCV32 CPU 模拟器。
  - 指导网络代理实验。
]
#TA("数据结构", liang, date: "2024 年夏")[
  - 提供详细的课程辅助资料与授课。
]
#TA("数据结构", weng, date: "2024 年春")[
  - 讲授教材之外的数据结构拓展内容。
  - 指导学生完成实验。
]
#TA("程序设计 (C++)", weng, date: "2023 年秋")[
  - 设计课后作业。
  - 命制期末考试 3 题中的 1 题。
  - 讲授 Git、CMake、Linux 使用以及分治法等算法。
]


#sectionsep

#section[其他项目]

#item(
  [ACM OnlineJudge 运维],
)[
  - 维护和更新上海交通大学 ACM 班的在线评测系统，服务超过 200 名学生。
  - 实现新功能，修复缺陷，确保系统稳定运行。
]

#item(
  [InfoCollect],
)[
  - 一个信息收集、LLM 摘要与展示系统。
  - 使用 FastAPI 与 Vue 实现，部署于云服务器。
]
