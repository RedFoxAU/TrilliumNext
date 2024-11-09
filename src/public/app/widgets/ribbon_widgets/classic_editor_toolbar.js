import NoteContextAwareWidget from "../note_context_aware_widget.js";

const TPL = `\
<div class="classic-toolbar-widget">
    Classic toolbar goes here.
</div>

<style>
    .classic-toolbar-widget {
        --ck-color-toolbar-background: transparent;
        --ck-color-button-default-background: transparent;
    }

    .classic-toolbar-widget .ck.ck-toolbar {
        border: none;
    }
</style>
`;

export default class ClassicEditorToolbar extends NoteContextAwareWidget {
    get name() {
        return "classicToolbar";
    }

    doRender() {
        this.$widget = $(TPL);
        this.contentSized();
    }

    async getTitle() {
        return {
            show: await this.#shouldDisplay(),
            activate: true,
            title: "Editor toolbar",
            icon: "bx bx-edit-alt"
        };
    }

    async #shouldDisplay() {
        if (this.note.type !== "text") {
            return false;
        }

        if (await this.noteContext.isReadOnly()) {
            return false;
        }

        return true;
    }

}