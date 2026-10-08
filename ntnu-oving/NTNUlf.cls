%
% Underklasse av NTNUoving som endrer \OVING til å inneholde
% en tekst om at dette er et løsningsforslag heller.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NTNUlf}[2004/10/11 Losningsforslagklasse]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{NTNUoving}}
\ProcessOptions
\LoadClass{NTNUoving}
\addto\extrasnorsk{%
  \def\OVING{L{\o}sningsforslag --- {\O}ving}%
}
\addto\extrasnynorsk{%
  \def\OVING{L{\o}ysingsforslag -- {\O}ving}%
}
\addto\extrasenglish{%
  \def\OVING{Solutions to exercise set}%
}

