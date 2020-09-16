package sc.wicket;

import sc.wicket.CTextField;
import sc.wicket.CTextArea;
import sc.wicket.CLabel;
import sc.wicket.CDropDownChoice;
import sc.wicket.CRadio;
import sc.wicket.CRadioGroup;
import sc.wicket.CAttributeModifier;
import sc.wicket.CForm;
import sc.wicket.CListView;
import sc.wicket.CWebPage;

public wicket.core extends meta, util {
   compiledOnly = true;

   public void start() {
      sc.layer.LayeredSystem system = getLayeredSystem();

      if (activated) {
         sc.lang.DefaultAnnotationProcessor wicketAppProc = new sc.wicket.ApplicationPathProcessor();
         //sc.lang.DefaultAnnotationProcessor wicketAppProc = new sc.lang.DefaultAnnotationProcessor();
         wicketAppProc.typeGroupName = "wicketApplications";
         wicketAppProc.validOnField = false;
         wicketAppProc.requiredType = "sc.wicket.WicketApplication";
         // These need to be compiled for wicket to find them.
         wicketAppProc.compiledOnly = true;

         registerAnnotationProcessor("sc.wicket.ApplicationPath", wicketAppProc);
      }

      sc.lang.sc.BasicScopeProcessor listItemScope = new sc.lang.sc.BasicScopeProcessor("ListItem");
      listItemScope.validOnClass = false;
      listItemScope.validOnField = false;
      listItemScope.validOnObject = true;
      listItemScope.objectTemplate= "sc.wicket.ListItemScope";
      listItemScope.contextParams = "<%= isAssignableTo(\"org.apache.wicket.Component\") ? %>\"<%=lowerClassName%>\",<% : \"\" %>listItemIndex,listItemModel";
      listItemScope.useNewTemplate = true;
      listItemScope.appendInterfaces = new String[] {"sc.dyn.IObjChildren", "sc.wicket.IListItemScope<T>"};
      listItemScope.requiredParentType = "sc.wicket.CListView";
      listItemScope.childGroupName = "ListItem"; // Children with this scope are not included in regular childreNames list - in childScopesByName under the key ListItem instead.
      registerScopeProcessor("ListItem", listItemScope);

      // Tells the system to regenerate web.xml when the set of wicketApplications changes
      if (activated)
         addTypeGroupDependency("web/WEB-INF/web.scxml", "web.WEB-INF.web", "wicketApplications");

      // Note: this sets the templatePrefix for all web files since there's one processor used for all of them.
      sc.layer.LayerFileProcessor webProc = (sc.layer.LayerFileProcessor) system.getFileProcessorForExtension("css");
      //webProc.templatePrefix = "web";
      addSrcPath("web", "web", "web", null);
   }

}
