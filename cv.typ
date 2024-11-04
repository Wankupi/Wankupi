#import "@preview/modernpro-cv:1.0.1": *
#import "@preview/fontawesome:0.5.0": *

#let ICPC = link("https://icpc.global/", "International Collegiate Programming Contest")
#let CCPC = link("https://ccpc.io/", "China Collegiate Programming Contest")
#let sjtu = link("https://en.sjtu.edu.cn/", "Shanghai Jiao Tong University")
#let zhiyuan = link("https://en.zhiyuan.sjtu.edu.cn/", "Zhiyuan College")
#let acm = link("https://acm.sjtu.edu.cn/", "ACM Class")

#let weng = "Huiyu Weng"
#let liang = "Alei Liang"
#let yu = "Yong Yu"
#let chen = "Guoxing Chen"

#let theme_color = rgb("#006885")

#show: cv-single.with(
  font-type: "Times New Roman",
  continue-header: "false",
  name: [Kunpeng Wang],
  address: [#acm, #sjtu],
  lastupdated: "true",
  pagecount: "true",
  date: "2024-10-12",
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
    block(inset: (left: 1em, right: 0em, top: -0.4em, bottom: -0.0em), text(size: 1em, detail))
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
  description: emph[BEng of Computer Science],
)[
  - Member of #underline(acm), #underline(zhiyuan)
  - GPA: 3.877/4.3
  - Selected courses: Programming Practice: 100, Compiler Design: 96, Operating System: 95, Algorithms: 98, Comprehensive
    Design for Computer System: 95.
]

#section[Research]

I'm enthusiastic about security, networks, and systems for machine learning. I have strong self-learning and hands-on
practical skills.

#item(
  "Network Security and Privacy Protection (NSEC) Lab",
  short: "SJTU",
  date: "June.2024~June.2026(expected)",
  show_detail: true,
)[
  Undergraduate Researcher, advised by #link("https://donnod.github.io/", underline(emph[Prof. #chen]))\
  Research Topic: Hardware/Software Co-design for Secure with Trust Execution Environment such as Intel SGX.
]

#sectionsep

// ----- separate -----

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

#sectionsep

// ----- separate -----

#section[Teaching Assistant Experience]

#let TA(class, teacher, date: "", extra: "", body) = {
  item(class, body, short: [#teacher], date: date, extra: extra)
}

#TA("Programming (C++)", weng, date: "Fall 2023")[
  - Created some homework
  - Set 1 of 3 final exam problems
  - Gave lectures on using Git, CMake, Linux, and some Algorithms
]
#TA("Data Structure", weng, date: "Spring 2024")[
  - Gave lectures on some extra data structures
  - Guided students to finish the labs
]
#TA("Data Structure", liang, date: "Summer 2024")[
  - Delivered some detailed aids and lessons
]
#TA("Programming Practice", yu, date: "Summer 2024")[
  - Created some CTF problems with the knowledge they learned (about Programming, Architecture, Cryptography)
  - Improve and optimize the major project: Simulator of RISCV32 CPU
  - Guided the lab of Network Proxy
]

#sectionsep

// ----- separate -----

#section[Projects Experience]

#item(
  [ACM Class Online Judge],
  short: "Maintainer and Contributors",
  date: "2023 ~ Present",
  extra: link("https://acm.sjtu.edu.cn/OnlineJudge"),
)[
  - An online judge system for some courses in SJTU, including Data Structure, Programming, etc.
  - Technology Stack: Flask, PostgreSQL, Redis, Nix, MinIO, Sandbox(nsjail), Nginx.
  - My Contributions: bug fix, new API system, some optimization, and other features.
]

#item(
  [Real-board Judger for Compiler],
  short: [Collaboration],
  date: "Oct.2024",
  extra: github("DarkSharpness/Compiler-Backend"),
)[
  - This project aims to improve the evaluation method of compiler courses.
  - A toolchain to inject, compile and run the code on the real board, and then give an accurate cycle report.
  - Provide 3 usage modes to support different hardware platforms: (1) using mini-kernel, (2) using Linux kernel + custom
    init program and (3) using in normal Linux.
]

#item(
  [Verified TypeInfer],
  short: [Group Course Project of Program Verification],
  date: "Spring 2024",
  extra: gitee("Wankupi/typeinfer"),
)[
  - This project aims to verify a C program "type inference" by Coq.
  - My work is to prove the correctness of the type inference algorithm, while my partner's is to prove the C program does
    implement the algorithm.
  - Above 2k lines of Coq code.
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
]

#item(
  [Traffic Prediction],
  short: [Group Course Project of Machine Learning],
  extra: github("DarkSharpness/TrafficPrediction"),
  date: "Spring 2024",
)[
  - Using PatchTST to predict the traffic flow based on the previous 24-hour traffic flow.
  - Features: Consider geographic information.
  - Rank 1st in the class.
]

#item(
  [RISCV32I CPU in Verilog RTL],
  short: [Course Project of Architecture],
  date: "Fall 2023",
  extra: github("Wankupi/RiSCV32-Processor/"),
)[
  - Features: Tomasulo, Branch Prediction, Instruction Cache, etc.
  - Could run on a Xilinx FPGA board.
]

#item( //
  [Mx-Compiler],
  short: [Course Project of Compiler],
  date: "Summer 2023",
  extra: github("Wankupi/MxCompiler"),
)[
  - A compiler from Mx language (a variant of C++ language designed for course) to RISCV32IM assembly
  - Implemented in C++ with antlr4.
  - Features: Register Allocation(Graphing Coloring), Mem2Reg, Constant Propagation, etc.
]

#item(
  [Network Proxy in Go],
  short: [Course Project of Programming Practice],
  date: "June.2023",
  extra: github("Wankupi/ppca-network"),
)[
  - Features: Transparent (tun), Socks5 protocol (tcp+udp), Forward and Reverse, Multi-level, etc.
]

#item(
  [Ticket System],
  short: [Course Project of Programming],
  extra: github("Wankupi/TicketSystem"),
  date: "Spring 2023",
)[
  - A system to manage users, trains, and tickets.
  - Features: Using B+tree as Database, Web Frontend (Vue and Websocket), Simultaneous Operation by Multiple Users,
    Implemented WebSocket in C++ backend.

]

#sectionsep

// ----- separate -----

#section[Skills and Interests]

#let o(content) = text(fill: theme_color, weight: "bold", content)

#o[Language]: Mandarin (Native), English

#o[Programming]: C++, Python, Rust, Go, Verilog, Coq, TypeScript, SQL, Shell.

#o[Technical experience]:
- Web Development: Flask, Vue, Nginx, MinIO.
- System: ArchLinux, Ubuntu, Nix, Docker.
- Database: MySQL, PostgreSQL, Redis.
- Other: Latex, Typst, Wayland, Vivado.

#o[Interests]: Badminton, Ping-Pong, Volleyball.