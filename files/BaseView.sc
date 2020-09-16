import sc.layer.Layer;
import sc.dyn.DynUtil;
import sc.type.CTypeUtil;

import sc.bind.Bind;
import sc.bind.AbstractListener;
import sc.bind.IListener;

import java.util.Iterator;

/** This is the base class for other views which involve a code model */
abstract class BaseView {
   EditorModel editorModel;

   @sc.obj.Sync
   boolean viewVisible;

   // Although this is somewhat redundant with currentJavaModel, if the merge/inherit flags are
   // changed we need some way to trigger the refresh of the property list. Right now it goes through
   // the model but it might be faster to have a separate way to just invalidate the property lists of
   // the current type in that case.
   editorModel =: invalidateModel();
   viewVisible =: invalidateModel();

   JavaModel currentJavaModel := editorModel.currentJavaModel;
   currentJavaModel =: invalidateModel();

   void invalidateModel() {
   }
}
