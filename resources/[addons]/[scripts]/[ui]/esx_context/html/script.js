const container = document.getElementById("container");

const CreateElement = (tag = "div", className = "", parent) => {
    const e = document.createElement(tag);
    e.className = className;

    if (parent) {
        parent.append(e);
    }

    return e;
};

function Open(eles, position = "right") {
    container.innerHTML = "";
    container.className = position;

    let navContainer = CreateElement("div", "navContainer", container);

    newItemToAdd = CreateElement("div", "newItemToAdd", container);
    newItemToAdd.style = "display: flex; gap: 5px; flex-direction: column; overflow-y: auto;";

    for (let i = 0; i < eles.length; i++) {
        let ele = eles[i];
        
        let item = CreateElement("div", "item", container);
        let icon = CreateElement("i", ele.icon, item);
        
        item.style = "width: 90%;";

        if (i === 0) {
            item.style = "width: 100%; padding: 15px 10px;";
            navContainer.appendChild(item);
            
            // let goBack = CreateElement("div", "go-back", navContainer);
            // goBack.innerHTML = "<";
            let closeBtn = CreateElement("div", "close-btn", navContainer);
            closeBtn.innerHTML = "X";
            
            closeBtn.addEventListener("click", () => {
                Close();
            });
        } else {
            newItemToAdd.appendChild(item);
        }

        if (ele.icon === "") {
            icon.style.display = "none";
            item.style.display = "block";
        } else {
            icon.style.display = "flex";
            icon.style.alignItems = "center";
        }

        let div = CreateElement("div", "", item);

        let title = CreateElement("b", "", div);
        title.innerHTML = ele.title;

        if (ele.description) {
            let desc = CreateElement("i", "", div);
            desc.innerHTML = ele.description || "";
        }

        if (ele.input) {
            fetch(`https://${GetParentResourceName()}/disableInput`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ disableInput: true })
            });
            if (ele.inputType === "radio") {
                for (let j = 0; j < ele.inputValues.length; j++) {
                    let v = ele.inputValues[j];
                    let container = CreateElement("label", "container", div);
                    container.innerHTML = v.text;

                    let input = CreateElement("INPUT", "", container);
                    input.type = "radio";
                    input.name = i + 1;
                    input.checked = (ele.inputValue || ele.inputPlaceholder || -1) === v.value;

                    let span = CreateElement("SPAN", "checkmark", container);

                    input.onchange = function () {
                        $.post(
                            `https://${GetParentResourceName()}/changed`,
                            JSON.stringify({
                                index: i + 1,
                                value: v.value,
                            })
                        );
                    };
                }
            } else {
                let input = CreateElement("input", "", div);
                input.type = ele.inputType;

                if (ele.inputValue) {
                    input.value = ele.inputValue;
                }

                if (ele.inputPlaceholder) {
                    input.placeholder = ele.inputPlaceholder;
                }

                switch (ele.inputType) {
                    case "number":
                        if (ele.inputMin) input.min = ele.inputMin;
                        if (ele.inputMax) input.max = ele.inputMax;

                        input.onchange = function () {
                            let v = Number(input.value);

                            if (ele.inputMin) {
                                v = Math.max(ele.inputMin, v);
                            }

                            if (ele.inputMax) {
                                v = Math.min(ele.inputMax, v);
                            }

                            input.value = v;

                            $.post(
                                `https://${GetParentResourceName()}/changed`,
                                JSON.stringify({
                                    index: i + 1,
                                    value: v,
                                })
                            );
                        };
                        break;

                    case "text":
                        input.onchange = function () {
                            $.post(
                                `https://${GetParentResourceName()}/changed`,
                                JSON.stringify({
                                    index: i + 1,
                                    value: input.value,
                                })
                            );
                        };
                        break;
                }
            }
        } else {
            if (ele.disabled) {
                item.className += " disabled";
            } else if (ele.unselectable) {
                item.className += " unselectable";
            } else if (!ele.input) {
                item.onclick = function () {
                    $.post(
                        `https://${GetParentResourceName()}/selected`,
                        JSON.stringify({
                            index: i + 1,
                        })
                    );
                };
            }
        }
    }

    document.body.style.display = "block";
}






function Closed() {
    document.body.style.display = "none";
}

function Close() {
    $.post(`https://${GetParentResourceName()}/closed`, (retVal) => {
        if (retVal) {
            Closed();
        }
    });
}

window.addEventListener("message", (e) => {
    let data = e.data;

    if (!data.func || !window[data.func]) {
        return;
    }

    window[data.func](...data.args);
});

window.addEventListener("keydown", (e) => {
    if (e.key === "Escape" || e.key === "Backspace") {
        if (e.target.tagName.toLowerCase() === "input") {
            return;
        }

        Close();
    }
});

// Open([
// 	{
// 		unselectable:true,
// 		icon:"fas fa-info-circle",
// 		title:"Unselectable Item (Header/Label?)",
// 	},
// 	{
// 		icon:"fas fa-check",
// 		title:"Item A",
// 		description:"Some description here. Add some words to make the text overflow."
// 	},
// 	{
// 		disabled:true,
// 		icon:"fas fa-times",
// 		title:"Disabled Item",
// 		description:"Some description here. Add some words to make the text overflow."
// 	},
// 	{
// 		icon:"fas fa-check",
// 		title:"Item B",
// 		description:"Some description here. Add some words to make the text overflow."
// 	},
// 	{
// 		input:true,
// 		icon:"fas fa-times",
// 		title:"Input Text",
// 		inputType:"text",
// 		inputPlaceholder:"Placeholder..."
// 	},
// 	{
// 		input:true,
// 		icon:"",
// 		title:"Input Number",
// 		inputType:"number",
// 		inputPlaceholder:"Placeholder...",
// 		inputValue:0,
// 		inputMin:0,
// 		inputMax:50
// 	},
// 	{
// 		input:true,
// 		icon:"",
// 		title:"Input Radio",
// 		inputType:"radio",
// 		inputPlaceholder:"turbocharger",
// 		inputValue:"supercharger",
// 		inputValues:[
// 			{
// 				value:"turbocharger",
// 				title:"Turbocharger"
// 			},
// 			{
// 				value:"supercharger",
// 				title:"Supercharger"
// 			},
// 		]
// 	}
// ])