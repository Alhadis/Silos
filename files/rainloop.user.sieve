
require ["fileinto"];

# This is RainLoop Webmail sieve script.
# Please don't change anything here.
# RAINLOOP:SIEVE

/*
BEGIN:FILTER:t1fpx8dapataitmjpy2otyw04fkef2qj
BEGIN:HEADER
eyJJRCI6InQxZnB4OGRhcGF0YWl0bWpweTJvdHl3MDRma2VmMnFqIiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6Im5vaXNlIiwiQ29uZGl0aW9ucyI6W3siRmllbGQiOiJTdWJqZWN0IiwiVHlwZSI6
IkNvbnRhaW5zIiwiVmFsdWUiOiJUcnVtcCIsIlZhbHVlU2Vjb25kIjoiIn0seyJGaWVsZCI6Il
N1YmplY3QiLCJUeXBlIjoiQ29udGFpbnMiLCJWYWx1ZSI6IkNvaGVuIiwiVmFsdWVTZWNvbmQi
OiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIjoiR2l1bG
xpYW5pIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOiJDb250
YWlucyIsIlZhbHVlIjoiTXVlbGxlciIsIlZhbHVlU2Vjb25kIjoiIn0seyJGaWVsZCI6IlN1Ym
plY3QiLCJUeXBlIjoiQ29udGFpbnMiLCJWYWx1ZSI6IldoaXRlIEhvdXNlIiwiVmFsdWVTZWNv
bmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIjoiUm
VwdWJsaWNhbiIsIlZhbHVlU2Vjb25kIjoiIn0seyJGaWVsZCI6IlN1YmplY3QiLCJUeXBlIjoi
Q29udGFpbnMiLCJWYWx1ZSI6ImNvbGx1c2lvbiIsIlZhbHVlU2Vjb25kIjoiIn0seyJGaWVsZC
I6IlN1YmplY3QiLCJUeXBlIjoiQ29udGFpbnMiLCJWYWx1ZSI6IkZvcnRuaXRlIiwiVmFsdWVT
ZWNvbmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIj
oiUFVCRyIsIlZhbHVlU2Vjb25kIjoiIn0seyJGaWVsZCI6IlN1YmplY3QiLCJUeXBlIjoiQ29u
dGFpbnMiLCJWYWx1ZSI6IkRlc3RpbnkiLCJWYWx1ZVNlY29uZCI6IiJ9LHsiRmllbGQiOiJTdW
JqZWN0IiwiVHlwZSI6IkNvbnRhaW5zIiwiVmFsdWUiOiJDYWxsIG9mIER1dHkiLCJWYWx1ZVNl
Y29uZCI6IiJ9LHsiRmllbGQiOiJTdWJqZWN0IiwiVHlwZSI6IkNvbnRhaW5zIiwiVmFsdWUiOi
JCYXR0bGVmaWVsZCIsIlZhbHVlU2Vjb25kIjoiIn0seyJGaWVsZCI6IlN1YmplY3QiLCJUeXBl
IjoiQ29udGFpbnMiLCJWYWx1ZSI6IkFzc2Fzc2luJ3MgQ3JlZWQiLCJWYWx1ZVNlY29uZCI6Ii
J9LHsiRmllbGQiOiJTdWJqZWN0IiwiVHlwZSI6IkNvbnRhaW5zIiwiVmFsdWUiOiJQbGF5ZXJV
bmtub3duIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOiJDb2
50YWlucyIsIlZhbHVlIjoiTWFuYWZvcnQiLCJWYWx1ZVNlY29uZCI6IiJ9LHsiRmllbGQiOiJT
dWJqZWN0IiwiVHlwZSI6IkNvbnRhaW5zIiwiVmFsdWUiOiJGYWNlYm9vayIsIlZhbHVlU2Vjb2
5kIjoiIn0seyJGaWVsZCI6IlN1YmplY3QiLCJUeXBlIjoiQ29udGFpbnMiLCJWYWx1ZSI6Im9i
c3RydWN0aW9uIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOi
JDb250YWlucyIsIlZhbHVlIjoiU2VuYXRlIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxkIjoi
U3ViamVjdCIsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIjoiQ29uZ3Jlc3MiLCJWYWx1ZVNlY2
9uZCI6IiJ9LHsiRmllbGQiOiJTdWJqZWN0IiwiVHlwZSI6IkNvbnRhaW5zIiwiVmFsdWUiOiJE
ZW1vY3JhdCIsIlZhbHVlU2Vjb25kIjoiIn0seyJGaWVsZCI6IlN1YmplY3QiLCJUeXBlIjoiQ2
9udGFpbnMiLCJWYWx1ZSI6Ik1lZGljYXJlIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxkIjoi
U3ViamVjdCIsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIjoiT3ZlcndhdGNoIiwiVmFsdWVTZW
NvbmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIjoi
QnVuZ2llIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOiJDb2
50YWlucyIsIlZhbHVlIjoiVGhlIERpdmlzaW9uIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxk
IjoiU3ViamVjdCIsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIjoiQXZlbmdlcnMiLCJWYWx1ZV
NlY29uZCI6IiJ9LHsiRmllbGQiOiJTdWJqZWN0IiwiVHlwZSI6IkNvbnRhaW5zIiwiVmFsdWUi
OiJSaWNrIEdhdGVzIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cG
UiOiJDb250YWlucyIsIlZhbHVlIjoiUmljaGFyZCBHYXRlcyIsIlZhbHVlU2Vjb25kIjoiIn0s
eyJGaWVsZCI6IlN1YmplY3QiLCJUeXBlIjoiQ29udGFpbnMiLCJWYWx1ZSI6IkFsZXggSm9uZX
MiLCJWYWx1ZVNlY29uZCI6IiJ9LHsiRmllbGQiOiJTdWJqZWN0IiwiVHlwZSI6IkNvbnRhaW5z
IiwiVmFsdWUiOiJZb3VUdWJlIiwiVmFsdWVTZWNvbmQiOiIifSx7IkZpZWxkIjoiU3ViamVjdC
IsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIjoiQmxhY2sgT3BzIiwiVmFsdWVTZWNvbmQiOiIi
fSx7IkZpZWxkIjoiU3ViamVjdCIsIlR5cGUiOiJDb250YWlucyIsIlZhbHVlIjoiYmF0dGxlIH
JveWFsZSIsIlZhbHVlU2Vjb25kIjoiIn0seyJGaWVsZCI6IlN1YmplY3QiLCJUeXBlIjoiQ29u
dGFpbnMiLCJWYWx1ZSI6IkFwZXggTGVnZW5kcyIsIlZhbHVlU2Vjb25kIjoiIn1dLCJDb25kaX
Rpb25zVHlwZSI6IkFueSIsIkFjdGlvblR5cGUiOiJNb3ZlVG8iLCJBY3Rpb25WYWx1ZSI6IklO
Qk9YXC9ub2lzZSIsIkFjdGlvblZhbHVlU2Vjb25kIjoiIiwiQWN0aW9uVmFsdWVUaGlyZCI6Ii
IsIkFjdGlvblZhbHVlRm91cnRoIjoiIiwiS2VlcCI6dHJ1ZSwiU3RvcCI6dHJ1ZSwiTWFya0Fz
UmVhZCI6ZmFsc2V9
END:HEADER
*/

if anyof(
    header :contains ["Subject"] "Trump",
    header :contains ["Subject"] "Cohen",
    header :contains ["Subject"] "Giulliani",
    header :contains ["Subject"] "Mueller",
    header :contains ["Subject"] "White House",
    header :contains ["Subject"] "Republican",
    header :contains ["Subject"] "collusion",
    header :contains ["Subject"] "Fortnite",
    header :contains ["Subject"] "PUBG",
    header :contains ["Subject"] "Destiny",
    header :contains ["Subject"] "Call of Duty",
    header :contains ["Subject"] "Battlefield",
    header :contains ["Subject"] "Assassin's Creed",
    header :contains ["Subject"] "PlayerUnknown",
    header :contains ["Subject"] "Manafort",
    header :contains ["Subject"] "Facebook",
    header :contains ["Subject"] "obstruction",
    header :contains ["Subject"] "Senate",
    header :contains ["Subject"] "Congress",
    header :contains ["Subject"] "Democrat",
    header :contains ["Subject"] "Medicare",
    header :contains ["Subject"] "Overwatch",
    header :contains ["Subject"] "Bungie",
    header :contains ["Subject"] "The Division",
    header :contains ["Subject"] "Avengers",
    header :contains ["Subject"] "Rick Gates",
    header :contains ["Subject"] "Richard Gates",
    header :contains ["Subject"] "Alex Jones",
    header :contains ["Subject"] "YouTube",
    header :contains ["Subject"] "Black Ops",
    header :contains ["Subject"] "battle royale",
    header :contains ["Subject"] "Apex Legends"
)
{
    fileinto "INBOX/noise";
    stop;
}

/* END:FILTER */

/*
BEGIN:FILTER:9y38lhltdd3ogp61pq28olwhbjifv9c6
BEGIN:HEADER
eyJJRCI6Ijl5MzhsaGx0ZGQzb2dwNjFwcTI4b2x3aGJqaWZ2OWM2IiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6Imp1bmsiLCJDb25kaXRpb25zIjpbeyJGaWVsZCI6IlN1YmplY3QiLCJUeXBlIjoi
Q29udGFpbnMiLCJWYWx1ZSI6IkdyZWVuIERlYWxzIiwiVmFsdWVTZWNvbmQiOiIifV0sIkNvbm
RpdGlvbnNUeXBlIjoiQW55IiwiQWN0aW9uVHlwZSI6Ik1vdmVUbyIsIkFjdGlvblZhbHVlIjoi
SU5CT1hcL25vaXNlIiwiQWN0aW9uVmFsdWVTZWNvbmQiOiIiLCJBY3Rpb25WYWx1ZVRoaXJkIj
oiIiwiQWN0aW9uVmFsdWVGb3VydGgiOiIiLCJLZWVwIjp0cnVlLCJTdG9wIjp0cnVlLCJNYXJr
QXNSZWFkIjpmYWxzZX0=
END:HEADER
*/

if header :contains ["Subject"] "Green Deals"
{
    fileinto "INBOX/noise";
    stop;
}

/* END:FILTER */

/*
BEGIN:FILTER:8ke6qjy226fvnle7fpd4jc9j3q9u6zon
BEGIN:HEADER
eyJJRCI6IjhrZTZxankyMjZmdm5sZTdmcGQ0amM5ajNxOXU2em9uIiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6ImNyb24iLCJDb25kaXRpb25zIjpbeyJGaWVsZCI6IlN1YmplY3QiLCJUeXBlIjoi
Q29udGFpbnMiLCJWYWx1ZSI6IkNyb24iLCJWYWx1ZVNlY29uZCI6IiJ9XSwiQ29uZGl0aW9uc1
R5cGUiOiJBbnkiLCJBY3Rpb25UeXBlIjoiTW92ZVRvIiwiQWN0aW9uVmFsdWUiOiJJTkJPWFwv
Y3JvbiIsIkFjdGlvblZhbHVlU2Vjb25kIjoiIiwiQWN0aW9uVmFsdWVUaGlyZCI6IiIsIkFjdG
lvblZhbHVlRm91cnRoIjoiIiwiS2VlcCI6dHJ1ZSwiU3RvcCI6dHJ1ZSwiTWFya0FzUmVhZCI6
ZmFsc2V9
END:HEADER
*/

if header :contains ["Subject"] "Cron"
{
    fileinto "INBOX/cron";
    stop;
}

/* END:FILTER */

/*
BEGIN:FILTER:kkc4sf2iqij1hbk56mtwwphe2on15luy
BEGIN:HEADER
eyJJRCI6ImtrYzRzZjJpcWlqMWhiazU2bXR3d3BoZTJvbjE1bHV5IiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6InJlZGRpdCIsIkNvbmRpdGlvbnMiOlt7IkZpZWxkIjoiRnJvbSIsIlR5cGUiOiJF
cXVhbFRvIiwiVmFsdWUiOiJSZWRkaXQgPG5vdGlmaWNhdGlvbnNAcmVkZGl0bWFpbC5jb20+Ii
wiVmFsdWVTZWNvbmQiOiIifV0sIkNvbmRpdGlvbnNUeXBlIjoiQW55IiwiQWN0aW9uVHlwZSI6
Ik1vdmVUbyIsIkFjdGlvblZhbHVlIjoiSU5CT1hcL3JlZGRpdCIsIkFjdGlvblZhbHVlU2Vjb2
5kIjoiIiwiQWN0aW9uVmFsdWVUaGlyZCI6IiIsIkFjdGlvblZhbHVlRm91cnRoIjoiIiwiS2Vl
cCI6dHJ1ZSwiU3RvcCI6dHJ1ZSwiTWFya0FzUmVhZCI6ZmFsc2V9
END:HEADER
*/

if header :is ["From"] "Reddit <notifications@redditmail.com>"
{
    fileinto "INBOX/reddit";
    stop;
}

/* END:FILTER */

/*
BEGIN:FILTER:bkv93e3c3m998oetqngrxivixoeatb7f
BEGIN:HEADER
eyJJRCI6ImJrdjkzZTNjM205OThvZXRxbmdyeGl2aXhvZWF0YjdmIiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6InJzczJlbWFpbCIsIkNvbmRpdGlvbnMiOlt7IkZpZWxkIjoiRnJvbSIsIlR5cGUi
OiJDb250YWlucyIsIlZhbHVlIjoidXNlckByc3MyZW1haWwuaW52YWxpZCIsIlZhbHVlU2Vjb2
5kIjoiIn1dLCJDb25kaXRpb25zVHlwZSI6IkFueSIsIkFjdGlvblR5cGUiOiJNb3ZlVG8iLCJB
Y3Rpb25WYWx1ZSI6IklOQk9YXC9yc3MyZW1haWwiLCJBY3Rpb25WYWx1ZVNlY29uZCI6IiIsIk
FjdGlvblZhbHVlVGhpcmQiOiIiLCJBY3Rpb25WYWx1ZUZvdXJ0aCI6IiIsIktlZXAiOnRydWUs
IlN0b3AiOnRydWUsIk1hcmtBc1JlYWQiOmZhbHNlfQ==
END:HEADER
*/

if header :contains ["From"] "user@rss2email.invalid"
{
    fileinto "INBOX/rss2email";
    stop;
}

/* END:FILTER */

/*
BEGIN:FILTER:sqm5xiqedp5nwot325r8ek9rirgtv6y2
BEGIN:HEADER
eyJJRCI6InNxbTV4aXFlZHA1bndvdDMyNXI4ZWs5cmlyZ3R2NnkyIiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6InN1YnNjcmFwZSIsIkNvbmRpdGlvbnMiOlt7IkZpZWxkIjoiRnJvbSIsIlR5cGUi
OiJDb250YWlucyIsIlZhbHVlIjoidXNlckBzdWJzY3JhcGUuaW52YWxpZCIsIlZhbHVlU2Vjb2
5kIjoiIn1dLCJDb25kaXRpb25zVHlwZSI6IkFueSIsIkFjdGlvblR5cGUiOiJNb3ZlVG8iLCJB
Y3Rpb25WYWx1ZSI6IklOQk9YXC9zdWJzY3JhcGUiLCJBY3Rpb25WYWx1ZVNlY29uZCI6IiIsIk
FjdGlvblZhbHVlVGhpcmQiOiIiLCJBY3Rpb25WYWx1ZUZvdXJ0aCI6IiIsIktlZXAiOnRydWUs
IlN0b3AiOnRydWUsIk1hcmtBc1JlYWQiOmZhbHNlfQ==
END:HEADER
*/

if header :contains ["From"] "user@subscrape.invalid"
{
    fileinto "INBOX/subscrape";
    stop;
}

/* END:FILTER */

/*
BEGIN:FILTER:ekh4xnytli7quae15af7d5ydg9bh582m
BEGIN:HEADER
eyJJRCI6ImVraDR4bnl0bGk3cXVhZTE1YWY3ZDV5ZGc5Ymg1ODJtIiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6InR3ZWV0c2NyYXBlIiwiQ29uZGl0aW9ucyI6W3siRmllbGQiOiJGcm9tIiwiVHlw
ZSI6IkNvbnRhaW5zIiwiVmFsdWUiOiJ1c2VyQHR3ZWV0c2NyYXBlLmludmFsaWQiLCJWYWx1ZV
NlY29uZCI6IiJ9XSwiQ29uZGl0aW9uc1R5cGUiOiJBbnkiLCJBY3Rpb25UeXBlIjoiTW92ZVRv
IiwiQWN0aW9uVmFsdWUiOiJJTkJPWFwvdHdlZXRzY3JhcGUiLCJBY3Rpb25WYWx1ZVNlY29uZC
I6IiIsIkFjdGlvblZhbHVlVGhpcmQiOiIiLCJBY3Rpb25WYWx1ZUZvdXJ0aCI6IiIsIktlZXAi
OnRydWUsIlN0b3AiOnRydWUsIk1hcmtBc1JlYWQiOmZhbHNlfQ==
END:HEADER
*/

if header :contains ["From"] "user@tweetscrape.invalid"
{
    fileinto "INBOX/tweetscrape";
    stop;
}

/* END:FILTER */

/*
BEGIN:FILTER:ekrc6vne9gg8u9exe3r98tuelelpd3r5
BEGIN:HEADER
eyJJRCI6ImVrcmM2dm5lOWdnOHU5ZXhlM3I5OHR1ZWxlbHBkM3I1IiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6InNtaWxlIiwiQ29uZGl0aW9ucyI6W3siRmllbGQiOiJGcm9tIiwiVHlwZSI6IkVx
dWFsVG8iLCJWYWx1ZSI6IlwiU21pbGVcIiA8c21pbGVAZXJzYXRzei5jb20+IiwiVmFsdWVTZW
NvbmQiOiIifV0sIkNvbmRpdGlvbnNUeXBlIjoiQW55IiwiQWN0aW9uVHlwZSI6Ik1vdmVUbyIs
IkFjdGlvblZhbHVlIjoiSU5CT1hcL3NtaWxlIiwiQWN0aW9uVmFsdWVTZWNvbmQiOiIiLCJBY3
Rpb25WYWx1ZVRoaXJkIjoiIiwiQWN0aW9uVmFsdWVGb3VydGgiOiIiLCJLZWVwIjp0cnVlLCJT
dG9wIjp0cnVlLCJNYXJrQXNSZWFkIjpmYWxzZX0=
END:HEADER
*/

if header :is ["From"] "\"Smile\" <smile@ersatsz.com>"
{
    fileinto "INBOX/smile";
    stop;
}

/* END:FILTER */

/*
BEGIN:FILTER:obpnkcu9egqrybiqp496l9wjkjej78zl
BEGIN:HEADER
eyJJRCI6Im9icG5rY3U5ZWdxcnliaXFwNDk2bDl3amtqZWo3OHpsIiwiRW5hYmxlZCI6dHJ1ZS
wiTmFtZSI6IndoaXoiLCJDb25kaXRpb25zIjpbeyJGaWVsZCI6IkZyb20iLCJUeXBlIjoiRXF1
YWxUbyIsIlZhbHVlIjoiV2hpeiA8d2hpekBlcnNhdHN6LmNvbT4iLCJWYWx1ZVNlY29uZCI6Ii
J9XSwiQ29uZGl0aW9uc1R5cGUiOiJBbnkiLCJBY3Rpb25UeXBlIjoiTW92ZVRvIiwiQWN0aW9u
VmFsdWUiOiJJTkJPWFwvd2hpeiIsIkFjdGlvblZhbHVlU2Vjb25kIjoiIiwiQWN0aW9uVmFsdW
VUaGlyZCI6IiIsIkFjdGlvblZhbHVlRm91cnRoIjoiIiwiS2VlcCI6dHJ1ZSwiU3RvcCI6dHJ1
ZSwiTWFya0FzUmVhZCI6ZmFsc2V9
END:HEADER
*/

if header :is ["From"] "Whiz <whiz@ersatsz.com>"
{
    fileinto "INBOX/whiz";
    stop;
}

/* END:FILTER */

