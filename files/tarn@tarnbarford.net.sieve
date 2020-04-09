require ["fileinto", "reject"];


if address :is "from" "piqd-testing@brainsome.de"
{
    fileinto "piqd-testing";
}

if address :is "from" "piqd-staging@brainsome.de"
{
    fileinto "piqd-staging";
}

if address :is "from" "nagios@monitoring.brainsome.de"
{
    fileinto "monitoring";
}

if address :is "from" "notifications@github.com"
{
    fileinto "github";
}

if address :is "from" "appstore@piqd.de"
{
    fileinto "brainsome";
}

if address :is "from" "panic@taktsoft.com"
{
    fileinto "brainsome";
}

if address :is "from" "hosting@brainsome.de"
{
    fileinto "brainsome";
}

if address :is "from" "developers@toria.com"
{
    fileinto "brainsome";
}

if address :is "to" "external-services@torial.com"
{
    fileinto "brainsome";
}

if address :is "from" "piqd@noreply.github.com"
{
    fileinto "brainsome";
}

if address :is "from" "notification@mail.sandbox.billwerk.com"
{
    fileinto "brainsome";
}

if address :is "from" "nagios@bonn.taktsoft.com"
{
    fileinto "brainsome";
}

if address :is "from" "bareos@tarnbarford.net"
{
    fileinto "notifications";
}

if address :is "from" "noreply-dmarc-support@google.com"
{
    fileinto "notifications";
}


