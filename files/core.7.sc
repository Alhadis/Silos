package sc.doc;

// Should this import be necessary?   Currently we do not prepend the layer's package to the lookup for relative types
// when prependLayerPackage is false (i.e. for the vdoc and web.xml type files).  They will have to explicitly
// import stuff even when it is in the same directory.
import sc.doc.templateSnippets;

import sc.doc.Example;
import sc.doc.PageLayout;
import sc.doc.ArticlePage;
import sc.doc.doc.DocPage;
import sc.doc.doc.IdePage;
import sc.doc.doc.WebDocPage;
import sc.doc.MarkDownPage;

/** 
 * The basic documentation layer.  It has components that require server features although some pages can partially run
 * in the browser the JS runtime is included. 
 */
public doc.core extends doc.tag, jetty.schtml {
   {
      System.setProperty("markDown.cmd", getRelativeFile("bin/markdown"));
   }
}
