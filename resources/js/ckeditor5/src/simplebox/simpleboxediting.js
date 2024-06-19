// simplebox/simpleboxediting.js
import { Plugin } from "@ckeditor/ckeditor5-core";
// ADDED 2 imports.
import { Widget, toWidget, toWidgetEditable } from "@ckeditor/ckeditor5-widget";
import InsertSimpleBoxCommand from "./insertsimpleboxcommand";

export default class SimpleBoxEditing extends Plugin {
    static get requires() {
        return [Widget];
    }

    init() {
        console.log("SimpleBoxEditing#init() got called");

        this._defineSchema();
        this._defineConverters();
        this.editor.commands.add(
            "insertSimpleBox",
            new InsertSimpleBoxCommand(this.editor)
        );
        this.editor.commands.add(
            "insertSimpleBox",
            new InsertSimpleBoxCommand(this.editor)
        );
        this.editor.commands.add("blockChange", {
            exec: function (editor) {
                const selection = editor.model.document.selection;
                const isBold = editor.commands.get("bold").value;

                // Toggle định dạng đậm
                editor.model.format("bold", !isBold, selection);
            },
        });
    }

    _defineSchema() {
        const schema = this.editor.model.schema;

        schema.register("simpleBox", {
            // Behaves like a self-contained block object (e.g. a block image)
            // allowed in places where other blocks are allowed (e.g. directly in the root).
            inheritAllFrom: "$blockObject",
        });

        schema.register("simpleBoxTitle", {
            // Cannot be split or left by the caret.
            isLimit: true,

            allowIn: "simpleBox",

            // Allow content which is allowed in blocks (i.e. text with attributes).
            allowContentOf: "$block",
        });

        schema.register("simpleBoxDescription", {
            // Cannot be split or left by the caret.
            isLimit: true,

            allowIn: "simpleBox",

            // Allow content which is allowed in the root (e.g. paragraphs).
            allowContentOf: "$root",
        });

        schema.addChildCheck((context, childDefinition) => {
            if (
                context.endsWith("simpleBoxDescription") &&
                childDefinition.name == "simpleBox"
            ) {
                return false;
            }
        });
    }

    _defineConverters() {
        const conversion = this.editor.conversion;

        // <simpleBox> converters
        conversion.for("upcast").elementToElement({
            model: "simpleBox",
            view: {
                name: "section",
                classes: "simple-box",
            },
        });
        conversion.for("dataDowncast").elementToElement({
            model: "simpleBox",
            view: {
                name: "section",
                classes: "simple-box",
            },
        });
        conversion.for("editingDowncast").elementToElement({
            model: "simpleBox",
            view: (modelElement, { writer: viewWriter }) => {
                const section = viewWriter.createContainerElement("section", {
                    class: "simple-box",
                });

                return toWidget(section, viewWriter, {
                    label: "simple box widget",
                });
            },
        });

        // <simpleBoxTitle> converters
        conversion.for("upcast").elementToElement({
            model: "simpleBoxTitle",
            view: {
                name: "div",
                classes: "simple-box-title",
            },
        });
        conversion.for("dataDowncast").elementToElement({
            model: "simpleBoxTitle",
            view: {
                name: "div",
                classes: "simple-box-title",
            },
        });
        conversion.for("editingDowncast").elementToElement({
            model: "simpleBoxTitle",
            view: (modelElement, { writer: viewWriter }) => {
                // Note: You use a more specialized createEditableElement() method here.
                const div = viewWriter.createEditableElement("div", {
                    class: "simple-box-title",
                });

                return toWidgetEditable(div, viewWriter);
            },
        });

        // <simpleBoxDescription> converters
        conversion.for("upcast").elementToElement({
            model: "simpleBoxDescription",
            view: {
                name: "div",
                classes: "simple-box-description",
            },
        });
        conversion.for("dataDowncast").elementToElement({
            model: "simpleBoxDescription",
            view: {
                name: "div",
                classes: "simple-box-description",
            },
        });
        conversion.for("editingDowncast").elementToElement({
            model: "simpleBoxDescription",
            view: (modelElement, { writer: viewWriter }) => {
                // Note: You use a more specialized createEditableElement() method here.
                const div = viewWriter.createEditableElement("div", {
                    class: "simple-box-description",
                });

                return toWidgetEditable(div, viewWriter);
            },
        });
    }
}
