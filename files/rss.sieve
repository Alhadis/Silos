require "fileinto";
require "variables";

# rss
if address :is "from"
["rsswatch@thaller.ws"
] {

  if header :matches "Folder" "*" {
    set "folder" ".${0}";
  }

  if header :matches "Feed" "*" {
    set "feed" ".${0}";
  }

  if header :matches "Filter" "*" {
    set "filter" ".${0}";
  }

  fileinto "rss${folder}${feed}${filter}";
  stop;
}
