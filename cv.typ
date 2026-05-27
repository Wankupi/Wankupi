#import "@preview/modernpro-cv:1.0.1": *
#import "@preview/fontawesome:0.5.0": *

#set page(paper: "us-letter")

#let link_bak = link
#let link = (url, text) => text
#let ICPC = link("https://icpc.global/", "International Collegiate Programming Contest (ICPC)")
#let CCPC = link("https://ccpc.io/", "China Collegiate Programming Contest (CCPC)")

#let link = link_bak
#let sjtu = link("https://en.sjtu.edu.cn/", "Shanghai Jiao Tong University")
#let zhiyuan = link("https://en.zhiyuan.sjtu.edu.cn/", "Zhiyuan College")
#let acm = link("https://acm.sjtu.edu.cn/", "ACM Class")

#let mit = "Massachusetts Institute of Technology"

#let weng = "Huiyu Weng"
#let liang = "Alei Liang"
#let yu = "Yong Yu"
#let guoxing = link("https://donnod.github.io/", underline(emph[Prof. Guoxing Chen]))
#let mengjia = link("https://people.csail.mit.edu/mengjia/", underline(emph[Prof. Mengjia Yan]))

// #let theme_color = rgb("#005dc8")
// #let theme_color = rgb("#003572")
#let theme_color = black
#let hl_color = theme_color

#show strong: set text(fill: hl_color)

#show: cv-single.with(
  font-type: "Times New Roman",
  continue-header: "false",
  name: [Kunpeng Wang],
  // address: [#acm, #sjtu],
  address: {},
  lastupdated: "true",
  pagecount: "false",
  date: datetime.today().display(),
  contacts: (
    (text: "kunpengw@mit.edu", link: "mailto:kunpengw@mit.edu"),
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

// I aim to expand the frontiers of verifiable security, building secure systems and developing more scalable verification methods.
// My long-term career goal is to become an independent researcher in computer security and formal verification, making innovative and impactful contributions to these fields.


#section[Education]

#item(
  mit,
  date: "2026 Fall",
  description: emph[Incoming Ph.D. of Electrical and Electronics Engineering],
)[]

#item(
  sjtu,
  date: [Sep 2022 ~ Jun 2026],
  description: emph[B.Eng. of Computer Science and Technology, Student in #underline(acm)],
)[]


#sectionsep

#section[Publications]

#item(
  [Interplay of Efficient Model Checking and Secure Processor Design: A Case Study on Secure Speculation],
)[
  _IEEE S&P 2026_ \
  Tingzhen Dong\*, *Kunpeng Wang\**, Yuheng Yang, Yu-Wei Fan, Qinhan Tan, Thomas Bourgeat, Sharad Malik, Mengjia Yan
]

#sectionsep

#section[Research Experience]

#item(
  link("https://github.com/MATCHA-MIT")[MATCHA Group],
  short: "MIT",
  date: "May 2025 ~ Dec 2025",
  show_detail: true,
)[
  Advised by #mengjia\
  Research Topic: secure (out-of-order) processor design and verification.

]

#item(
  link("https://nsec.sjtu.edu.cn/")[Network Security and Privacy Protection (NSEC) Lab],
  short: "SJTU",
  date: "June 2024 ~ June 2026",
  show_detail: true,
)[
  Advised by #guoxing\
  Research Topic: verifiable interrupt-based side-channel mitigation for trusted execution environment.
]


#section[Awards]

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

// #grid(
//   columns: (1fr, 1fr),
//   column-gutter: 2em,
// )[
#award(
  award: [Outstanding Graduate of Shanghai],
  date: "2026",
  inst: [#sjtu],
)
#award(
  award: [Huawei Scholarship],
  date: "2025",
  inst: [#sjtu],
)
#award(
  award: [Golden Medal],
  date: "2022",
  inst: [#ICPC, Hangzhou],
)
#award(
  award: [Golden Medal],
  date: "2022",
  inst: [#ICPC, Nanjing],
)
#award(
  award: [Bronze Medal],
  date: "2022",
  inst: [#ICPC, Hongkong],
)
#award(award: "Silver Medal", date: "2022", inst: [#CCPC, Weihai])
// ][
#award(award: "Merit Student", date: "2023", inst: sjtu, extra: [one per class only])
#award(award: "Zhiyuan Honorary Scholarship", date: "2022,2023,2024", inst: zhiyuan, extra: [top 10% in SJTU])
#award(award: "First Prize Scholarship", date: "2023", inst: zhiyuan, extra: [top 3 in class])
// ]


#sectionsep

// ----- separate -----

#let item = item.with(show_detail: true)

#section[Course Projects]

#item(
  [Verified TypeInfer],
  date: "Spring 2024",
  extra: gitee("Wankupi/typeinfer"),
)[
  - Use Coq to verify the correctness of a type inference algorithm implemented by C.
  - 2k lines of Coq code.
]
#item(
  [Mx-Compiler],
  date: "Summer 2023",
  extra: github("Wankupi/MxCompiler"),
)[
  - A compiler from Mx language (a variant of C++ language designed for course) to RISCV32IM assembly
  - Features: Graphing Coloring, Mem2Reg, Constant Propagation, etc.
  - 15.8k lines C++ code.
]
#item(
  [RISCV32I CPU],
  date: "Fall 2023",
  extra: github("Wankupi/RiSCV32-Processor"),
)[
  - Features: Tomasulo, Branch Prediction, Instruction Cache, etc.
  - Tested on a Xilinx FPGA board.
  - 3.3k lines of Verilog code.
]
#item(
  [RISCV64 Macrokernel],
  date: "Spring 2024",
  extra: github("Wankupi/kernel"),
)[
  - Features: KASLR, Virtual Memory, Buddy Allocator, Unix-like Syscall, etc.
  - Contain full stack codes from bootloader to user programs.
  - Tested on real hardware, VisionFive2.
  - 3k lines of Rust code.
]

// #sectionsep

// #let item = item.with(show_detail: false)

#section[Teaching Assistant Experience]

#let TA(class, teacher, date: "", extra: "", body) = {
  item(class, body, short: [#teacher], date: date, extra: extra)
}

#TA("Programming Practice", yu, date: "Summer 2024")[
  - Create CTF problems with the knowledge students have learned (about Programming, Architecture, Cryptography).
  - Improve and optimize the major project: Simulator of RISCV32 CPU.
  - Guide the lab of Network Proxy.
]
#TA("Data Structure", liang, date: "Summer 2024")[
  - Deliver detailed aids and lessons.
]
#TA("Data Structure", weng, date: "Spring 2024")[
  - Give lectures on data structures beyond the textbook.
  - Guide students to finish the labs.
]
#TA("Programming (C++)", weng, date: "Fall 2023")[
  - Create homeworks.
  - Set 1 of 3 final exam problems.
  - Give lectures on using Git, CMake, Linux, and Algorithms like divide and conquer.
]


#sectionsep

#section[Other Projects]

#item(
  [ACM OnlineJudge Maintainer],
)[
  - Maintain and update the ACM Online Judge system for SJTU ACM Class, which serves over 200 students.
  - Implement new features, fix bugs, and ensure the stability of the system.
]

#item(
  [InfoCollect],
)[
  - A information collection, LLM summary and presentation system.
  - Implemented with FastAPI and Vue, deployed on a cloud server.
]
