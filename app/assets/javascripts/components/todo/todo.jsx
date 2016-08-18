var Todo = React.createClass({
  getInitialState: function() {
    return {preps: [], dash: [], currentPrep: null}
  },
  componentDidMount: function() {
    var reactParent = this;
    $.ajax("/todo/preps").then(function(preps) {
      reactParent.setState({preps: preps});
    });
    reactParent.updateDash();
  },
  updateDash: function() {
    var reactParent = this;
    $.ajax("todo/dash").then(function(dash){
      reactParent.setState({dash: dash});
    });
  },
  setCurrentPrep: function(prep) {
    this.setState({currentPrep: prep})
  },
  updatePrep: function(prep) {
    var reactParent = this;
    $.post("/todo/preps/", {prep: prep}).then(function(prep) {
      var updatedPrepList = reactParent.state.preps;
      reactParent.setState({preps: updatedPrepList, currentPrep: null});
    });
    reactParent.updateDash();
  },
  updateNote: function(prep) {
    var reactParent = this;
    $.post("/todo/preps/", {prep: prep}).then(function(prep) {
      var updatedPrepList = reactParent.state.preps;
      reactParent.setState({preps: updatedPrepList, currentPrep: null});
    });
  },
  deletePrep: function(prep) {
    var reactParent = this;
    $.ajax("/todo/preps/"+ prep.id, {prep: prep, type:"DELETE"}).then(function(prep) {
      reactParent.componentDidMount();
      reactParent.setState({currentPrep: null});
    });
  },
  render: function() {
    return(
      <div>
        <Dashboard dash={this.state.dash}/>
        <PrepList handleClick={this.setCurrentPrep} preps={this.state.preps} updatePrep={this.updatePrep} deletePrep={this.deletePrep}/>
        <ShowPrep prep={this.state.currentPrep} updatePrep={this.updatePrep} noteChanged={this.noteChanged} updateNote={this.updateNote} deletePrep={this.deletePrep}/>
    </div>
    );
  }
});

// var ready = function () {
//   ReactDOM.render(
//     <Todo />,
//     document.getElementById("todo")
//   );
// };
//
// // $(document).ready(ready);
//
// $(document).ready(function() {
//   if ($("#todo").length > 0) {
//     ReactDOM.render(
//       <Todo />,
//       document.getElementById("todo")
//     );
//   }
// });
