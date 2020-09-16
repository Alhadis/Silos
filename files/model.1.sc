package sc.editor;

import java.util.Map;
import java.util.HashSet;
import java.util.EnumSet;
import java.util.Set;
import java.util.Collections;

import sc.layer.CodeType;

import sc.layer.SrcEntry;
import sc.layer.Layer;
import sc.layer.LayeredSystem;

import sc.type.CTypeUtil;

import sc.util.LinkedHashMap;
import sc.util.StringUtil;

import sc.bind.Bind;
import sc.bind.IListener;
import sc.bind.AbstractListener;

import sc.sync.SyncManager;
import sc.obj.Sync;
import sc.obj.SyncMode;
import sc.obj.Exec;
import sc.obj.Constant;

import sc.lang.java.JavaModel;
import sc.lang.template.Template;
import sc.lang.java.VariableDefinition;
import sc.lang.sc.PropertyAssignment;
import sc.lang.java.IVariableInitializer;
import sc.lang.java.TypeDeclaration;
import sc.lang.java.ClientTypeDeclaration;
import sc.lang.java.ModelUtil;
import sc.lang.EditorContext;
import sc.lang.CompletionTypes;
import sc.lang.ModelError;
import sc.lang.html.Element;
import sc.lang.java.TypeDeclaration;
import sc.lang.java.BodyTypeDeclaration;
import sc.lang.InstanceWrapper;
import sc.lang.java.AbstractMethodDefinition;
import sc.lang.java.Parameter;
import sc.lang.java.IVariableInitializer;

import sc.type.IResponseListener;

@Sync(syncMode=sc.obj.SyncMode.Automatic)
public editor.model extends util, gui.util.core, sys.layeredSystem {
   codeType = CodeType.Model;

   // This layer needs sys.layeredSystem when in the server and js.layer when in the browser.
   // Because we only extend sys.layeredSystem we need to not inherit that runtime dependency
   // and not export it to layers that extend us.
   exportRuntime = false;
   inheritRuntime = false;

   liveDynamicTypes = layeredSystem.options.editEditor;
   hidden = !layeredSystem.options.editEditor;

   void init() {
      // When the editor is enabled, by default we turn on dynamic types
      layeredSystem.options.liveDynamicTypes = true;
   }
}
