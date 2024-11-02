#import "@preview/modernpro-cv:1.0.1": *
#import "@preview/fontawesome:0.5.0": *

#let ICPC = "International Collegiate Programming Contest"
#let CCPC = "China Collegiate Programming Contest"
#let sjtu = "Shanghai Jiaotong University"
#let zhiyuan = [Zhiyuan College, #sjtu]

#let weng = "Huiyu Weng"
#let liang = "Alei Liang"
#let yu = "Yong Yu"


#show: cv-single.with(
  font-type: "PT Serif",
  continue-header: "false",
  name: "Kunpeng Wang",
  address: [ACM Class, #sjtu],
  lastupdated: "true",
  pagecount: false,
  date: "2024-10-12",
  contacts: (
    (text: "kunpengwang@sjtu.edu.cn", link: "mailto:kunpengwang@sjtu.edu.cn"),
    (text: [#fa-icon("github") #h(0.2em) Wankupi], link: "https://www.github.com/Wankupi"),
    (text: "(+86) 15226606796"),
    (text: [Blog], link: "https://acm.sjtu.edu.cn/~kunpengwang"),
    (text: "ORCID: 0009-0007-3720-6319", link: "https://orcid.org/0009-0007-3720-6319"),
  ),
)

#let item(title, detail, short: "", date: "", extra: "", description: "", show_detail: false) = {
  oneline-two(entry1: {
    text(weight: "bold", title)
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
    block(inset: (left: 1em, right: 0em, top: -0.5em, bottom: -0.1em), text(size: 0.9em ,detail))
  }
}

#let github(path) = link("https://github.com/" + path)[#fa-icon("github") #path]

#section[Education]

#education(
  institution: "Shanghai Jiaotong University",
  major: "BEng of Computer Science",
  date: "Sept.2022 ~ Present",
  location: "China",
  description: [
    - Member of #underline[ACM honors class], #underline[Zhiyuan College]
    - Selected courses: Programming Practice: 100, Compiler Design: 96, Operating System: 95, Algorithms: 98, Comprehensive Design for Computer System: 95.
  ],
)

#section[Research]

I'm enthusiastic about security, network and system for machine learning.

#item(
  "Network Security and Privacy Protection (NSEC) Lab",
  short: "SJTU",
  date: "June.2024~June.2026(expected)",
  show_detail: true,
)[
  Undergraduate Researcher, advised by #underline(emph[Prof. Guoxing Chen]) and #underline(emph[PhD. Zhen Huang]).\
  Research Topic: Hardware/Software Co-design for Secure with Trust Execution Environment such as Intel SGX.
]

#section[Teaching Assistant Experience]

#let TA(class, teacher, date: "", extra: "", body) = {
  item(class, body, short: [#teacher], date: date, extra: extra)
}

#TA("Programming (C++)", weng, date: "Fall 2023")[
  - Created some homework
  - Set 1 of 3 final exam problems
  - Gave lectures on using Git, CMake, Linux and some Algorithms
]
#TA("Data Structure", weng, date: "Spring 2024")[
  - Gave lectures on some extra data structures
  - Guided students to finish the labs
]
#TA("Data Structure", liang, date: "Summer 2024", extra: "for non computer majors")[
  - Delivered some detailed aids and lessons
]
#TA("Programming Practice", yu, date: "Summer 2024")[
  - Created some CTF problems with the knowledge they learned (about Programming, Architecture, Cryptography)
  - Improve and optimize the major project: Simulator of RISCV32 CPU
  - Guided the lab of Network Proxy
]

#section[Selected Awards]

#let award(award: "", institution: "", date: "", extra: "", description: "") = {
  item(award, short: institution, date: date, extra: extra, description: description)[]
}

#award(award: "Silver Medal", date: "Nov.2022", institution: [#CCPC, Weihai])
#award(award: "Golden Medal", date: "Dec.2022", institution: [#ICPC, Hangzhou])
#award(award: "Golden Medal", date: "Dec.2022", institution: [#ICPC, Nanjing])
#award(award: "Bronze Medal", date: "Jan.2023", institution: [#ICPC, Hangkang])
#award(award: "Merit Student", date: "2023", institution: sjtu, extra: "one per class only")
#award(award: "Zhiyuan Honorary Scholarship", date: "2022,2023,2024", institution: zhiyuan, extra: "top 2% in SJTU")
#award(award: "First Prize Scholarship", date: "2023", institution: zhiyuan, extra: "top 3 in class")

// ----- separate -----

#section[Projects Experience]

#let item = item.with(show_detail: true)

#item(
  [ACM Class Online Judge],
  short: "Maintainer and Contributors",
  date: "2023 ~ Present",
  extra: link("https://acm.sjtu.edu.cn/OnlineJudge"),
)[
  - A online judge system for some courses in SJTU, including Data Structure, Programming, etc.
  - Technology Stack: Flask, PostgreSQL, Redis, Nix, MinIO, Sandbox(nsjail), Nginx.
  - My Contributions: bug fix, new api system, some optimization and some other features.
]
#item( //
  [Mx-Compiler],
  short: [Course Project of Compiler],
  date: "Summer 2023",
  extra: github("Wankupi/MxCompiler"),
)[
  - A compiler from Mx language (a variant of C++ language designed for course) to RISCV32I assembly
  - Implemented in C++ with antlr4
  - Features: Register Allocation(Graphing Coloring), Mem2Reg, Constant Propagation, etc.
]
#item(
  [RISCV32I CPU in Verilog RTL],
  short: [Course Project of Architecture],
  date: "Fall 2023",
  extra: github("Wankupi/RiSCV32-Processor/"),
)[
  - Features: Tomasulo, Branch Prediction, Instruction Cache, etc.
]
#item([RISCV64 Macrokernel in Rust], short: [Course Project of Operating System], date: "Spring 2024", extra: github("Wankupi/kernel"))[
  - Includes a sbi implementation to boot the kernel.
  - Could run on VisionFive2 board.
]
#item([Real-board Judger for Compiler], short: [Collaboration], date: "Oct.2024", extra: github("DarkSharpness/Compiler-Backend"))[
  - This project aims to improve the evaluation method of compiler courses.
  - A toolchain to inject, compile and run the code on the real board, and then give an accurate cycle report.
]
#item([Sockets Proxy in Go], short: [Course Project of Programming Practice], date: "June.2023", extra: github("Wankupi/ppca-network"))[
  - Features: Transparent (tun), Socks5 protocol (tcp+udp), Forward and Reverse, Multi level, etc.
]
