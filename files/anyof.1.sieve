if anyof (header :contains "Subject" "최진실",
	header :contains "From" "pine@hedwig.org")
{
	fileinto "지운 편지함";
}