import sc.lang.EditorContext;
import sc.lang.java.JavaModel;
import sc.layer.SrcEntry;

class ModelEditor {
   @sc.obj.Sync(syncMode=sc.obj.SyncMode.Disabled)
   EditorContext ctx;
   boolean modelChanged = false;

   // Some editors operate directly on the file, others can work on the model directly in memory
   @sc.obj.Sync(syncMode=sc.obj.SyncMode.Disabled)
   EditorModel.SelectedFile file;
   JavaModel model := file.model;

   // Called when the model itself changes
   model =: modelChanged();

   void modelChanged() {
      JavaModel newModel = model.resolve();
      // The actual JavaModel instance changed!
      if (newModel != model)
         model = newModel;
   }

   int fontSize = 14;

   void modelTextEdited() {}

   void startEditor() {}

   void removeEditor() {}

   void showCursor(boolean val) {}

   public void centerLineInView() {}
}
