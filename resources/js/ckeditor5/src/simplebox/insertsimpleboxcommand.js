import { Command } from "@ckeditor/ckeditor5-core";

export default class InsertSimpleBoxCommand extends Command {
    execute() {
        this.editor.model.change((writer) => {
            // Insert <simpleBox>*</simpleBox> at the current selection position
            // in a way that will result in creating a valid model structure.
            this.editor.model.insertObject(createSimpleBox(writer));
        });
    }

    refresh() {
        const model = this.editor.model;
        const selection = model.document.selection;
        const allowedIn = model.schema.findAllowedParent(
            selection.getFirstPosition(),
            "simpleBox"
        );

        this.isEnabled = allowedIn !== null;
    }
}

function createSimpleBox(writer) {
    const simpleBox = writer.createElement("simpleBox");
    const simpleBoxTitle = writer.createElement("simpleBoxTitle");
    writer.insertText("shortCode", simpleBoxTitle);
    writer.append(simpleBoxTitle, simpleBox);
    return simpleBox;
}
