#import "@preview/modernpro-cv:1.0.1": *
#import "@preview/fontawesome:0.5.0": *

#let link_bak = link
#let link = (url, text) => text
#let ICPC = link("https://icpc.global/", "International Collegiate Programming Contest (ICPC)")
#let CCPC = link("https://ccpc.io/", "China Collegiate Programming Contest (CCPC)")

#let link = link_bak
#let sjtu = link("https://en.sjtu.edu.cn/", "Shanghai Jiao Tong University")
#let zhiyuan = link("https://en.zhiyuan.sjtu.edu.cn/", "Zhiyuan College")
#let acm = link("https://acm.sjtu.edu.cn/", "ACM Class")

#let weng = "Huiyu Weng"
#let liang = "Alei Liang"
#let yu = "Yong Yu"
#let chen = "Guoxing Chen"

#let theme_color = rgb("#005dc8")
#let hl_color = theme_color

#show strong: set text(fill: hl_color)

#show: cv-single.with(
  font-type: "Times New Roman",
  continue-header: "false",
  name: [Kunpeng Wang],
  address: [#acm, #sjtu],
  lastupdated: "true",
  pagecount: "true",
  date: datetime.today().display(),
  contacts: (
    (text: "kunpengwang@sjtu.edu.cn", link: "mailto:kunpengwang@sjtu.edu.cn"),
    (text: [#fa-icon("github")Wankupi], link: "https://www.github.com/Wankupi"),
    (text: "(+86) 15226606796"),
    (text: [Blog], link: "https://acm.sjtu.edu.cn/~kunpengwang"),
    (text: [#fa-icon("orcid")0009-0007-3720-6319], link: "https://orcid.org/0009-0007-3720-6319"),
  ),
)

#let item(title, detail, short: "", date: "", extra: "", description: "", show_detail: true) = {
  oneline-two(entry1: {
    text(weight: "bold", fill: theme_color, title)
    if (short != "") {
      [, ]
      // text(style: "italic", short)
      short
    }
    if (extra != "") {
      [, ]
      text(style: "italic", extra)
    }
  }, entry2: date)
  if (description != "") {
    description
  }
  if (show_detail and detail != []) {
    block(inset: (left: 1em, right: 0em, top: -0.5em, bottom: -0.0em), text(size: 1em, detail))
  }
}

#let github(path) = link("https://github.com/" + path)[#fa-icon("github")#path]
#let gitee(path) = link(
  "https://gitee.com/" + path,
)[#box(image("gitee-logo.svg"), height: 1em, inset: (right: -0.4em, bottom: -0.1em, top: 0.05em)) #path]

#section[Education]

#item(
  sjtu,
  date: "Sep.2022 ~ Present",
  description: emph[B.Eng. of Computer Science and Technology],
)[
  - Member of #underline(acm), #underline(zhiyuan)
  - Academic credit score: 90.4/100.
  - Selected courses: Program Verification: 99, Programming Practice: 100, Compiler Design: 96, Operating System: 95,
    Algorithms: 98, Comprehensive Design for Computer System: 95.
]

#section[Research]

I'm enthusiastic about formal verification, architecture, and system security. I have strong self-learning and hands-on
practical skills.

#item(
  "Network Security and Privacy Protection (NSEC) Lab",
  short: "SJTU",
  date: "June.2024~June.2026(expected)",
  show_detail: true,
)[
  Undergraduate Researcher, advised by #link("https://donnod.github.io/", underline(emph[Prof. #chen]))\
  Research Topic: verifiable interrupt-based side-channel mitigation for trusted execution environment.
]

#sectionsep

// ----- separate -----

#section[Selected Awards]

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
    award: [$2 times$ Golden Medal, $1times$ Bronze Modal],
    date: "2022",
    inst: ICPC,
    inst2: [Hangzhou, Nanjing and Hangkang],
  )
  #award(award: "Silver Medal", date: "Nov.2022", inst: CCPC, inst2: "Weihai")
][
  #award(award: "Merit Student", date: "2023", inst: sjtu, extra: [*one* per class only])
  #award(award: "Zhiyuan Honorary Scholarship", date: "2022,2023,2024", inst: zhiyuan, extra: [top *2%* in SJTU])
  #award(award: "First Prize Scholarship", date: "2023", inst: zhiyuan, extra: [top *3* in class])
]

#sectionsep

// ----- separate -----

#let item = item.with(show_detail: true)

#section[Selected Projects]

#item(
  [Verified TypeInfer],
  short: [Group Course Project of Program Verification],
  date: "Spring 2024",
  extra: gitee("Wankupi/typeinfer"),
)[
  - This project aims to verify a C program "type inference" by Coq.
  - My work is to prove the correctness of the type inference algorithm, while my partner's is to prove the C program does
    implement the algorithm.
  - Above *2k* lines of *Coq* code.
]
#item( //
  [Mx-Compiler],
  short: [Course Project of Compiler],
  date: "Summer 2023",
  extra: github("Wankupi/MxCompiler"),
)[
  - A compiler from Mx language (a variant of C++ language designed for course) to RISCV32IM assembly
  - Features: Register Allocation(Graphing Coloring), Mem2Reg, Constant Propagation, etc.
  - About *15.8k* lines *C++* code.
]
#item(
  [RISCV32I CPU in Verilog RTL],
  short: [Course Project of Architecture],
  date: "Fall 2023",
  extra: github("Wankupi/RiSCV32-Processor"),
)[
  - Features: Tomasulo, Branch Prediction, Instruction Cache, etc.
  - Could run on a Xilinx FPGA board.
  - About *3.3k* lines of *Verilog* code.
]
#item(
  [RISCV64 Macrokernel in Rust],
  short: [Course Project of Operating System],
  date: "Spring 2024",
  extra: github("Wankupi/kernel"),
)[
  - Includes an SBI implementation to boot the kernel.
  - Could run on VisionFive2 board.
  - Features: KASLR, Virtual Memory, Buddy Allocator, Unix-like Syscall, etc.
  - About *3k* lines of *Rust* code.
]

#sectionsep

// ----- separate -----

#let item = item.with(show_detail: false)

#section[Teaching Assistant Experience]

#let TA(class, teacher, date: "", extra: "", body) = {
  item(class, body, short: [#teacher], date: date, extra: extra)
}

#grid(columns: (1fr, 1fr), column-gutter: 2em)[
  #TA("Programming (C++)", weng, date: "Fall 2023")[
    - Created some homework
    - Set 1 of 3 final exam problems
    - Gave lectures on using Git, CMake, Linux, and some Algorithms
  ]
  #TA("Data Structure", weng, date: "Spring 2024")[
    - Gave lectures on some extra data structures
    - Guided students to finish the labs
  ]
][
  #TA("Data Structure", liang, date: "Summer 2024")[
    - Delivered some detailed aids and lessons
  ]
  #TA("Programming Practice", yu, date: "Summer 2024")[
    - Created some CTF problems with the knowledge they learned (about Programming, Architecture, Cryptography)
    - Improve and optimize the major project: Simulator of RISCV32 CPU
    - Guided the lab of Network Proxy
  ]
]
