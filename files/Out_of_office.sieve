 
require ["date","relational","vacation","variables"];
set "subject" "";
if header :matches "subject" "*"
{
        set "subject" "${1}";
}
# rule:[vac]
if anyof (header :contains "From" "example.com",
        header :contains "From" "noreply",
        header :contains "X-Spam-Flag" "YES"){
        stop;
}
if anyof (currentdate :is "weekday" "2",
        currentdate :value "gt" "date" "2018-08-08",
        currentdate :value "lt" "date" "2018-08-17",
        {
        vacation :days 1 :addresses "my@example.com" :subject "Out of office: ${subject}" :from "my@example.com" text:

Message Text

.
;
}
