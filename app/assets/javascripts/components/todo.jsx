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
  render: function() {
    return(
      <div>
        <Dashboard dash={this.state.dash}/>
        <PrepList handleClick={this.setCurrentPrep} preps={this.state.preps} updatePrep={this.updatePrep}/>
        <ShowPrep prep={this.state.currentPrep} updatePrep={this.updatePrep} noteChanged={this.noteChanged} updateNote={this.updateNote}/>
      </div>
    );
  }
});

var Dashboard = React.createClass({
  render: function() {
    var dashStats = [];

    for (var i = 0; i < this.props.dash.length; i++) {
      dashStats.push(<DashStat key={i} stat={this.props.dash[i]}/>)
    }

    return(
      <div className="prep-dashboard">
        {dashStats}
      </div>
    )
  }
});

var DashStat = React.createClass({
  render: function() {
    var body;
    body = (
      <div>
        <div id="completed-by-int">
          <span id="completed-preps-int">{this.props.stat.completed_preps}</span>
          of
          <span id="total-preps-int">{this.props.stat.total_preps}</span>
           preps completed
          (<span id="all-preps-pct">{this.props.stat.all_prep_progress}</span>%)
        </div>
      </div>
    )
    return(
      <div>
        {body}
      </div>
    )
  }
})

var PrepList = React.createClass({
  render: function() {
    var prepDivs = [];

    for (var i = 0; i < this.props.preps.length; i++) {
      prepDivs.push(<PrepItem updatePrep={this.props.updatePrep} handleClick={this.props.handleClick} key={i} prep={this.props.preps[i]}/>)
    }

    return(
      <div className="prep-list">
        {prepDivs}
      </div>
    )
  }
});

var PrepItem = React.createClass({
  showPrep: function() {
    this.props.handleClick(this.props.prep);
  },
  toggleCompletion: function() {
    var prep = this.props.prep;
    prep.completed = !prep.completed;
    this.props.updatePrep(prep);
  },
  render: function() {
    var body;
    if (this.props.prep.completed) {
      body = (
        <p className="crossed-out" data-prep-type={this.props.prep.prep_type}>{this.props.prep.question.contents}</p>
      )
    } else {
      body = <p data-prep-type={this.props.prep.prep_type}>{this.props.prep.prep_type}: {this.props.prep.question.contents}</p>
    }
    return(
      <div onClick={this.showPrep} className="prep-item">
        <input checked={this.props.prep.completed} onClick={this.toggleCompletion} type="checkbox" className="prep-check"></input>
        {body}
      </div>
    )
  }
});

var ShowPrep = React.createClass({
  getInitialState: function() {
    return {notes: null};
  },
  // componentDidMount: function() {
  //   var showPrepParent = this;
  //   var prep = this.props.prep;
  //   console.log(prep);
  //   // $.ajax("/todo/preps/" + prep.id).then(function(prep) {
  //   //   console.log(prep);
  //   //   // showPrepParent.setState({notes: prep.notes});
  //   // });
  // },
  noteSubmit: function(event) {
    event.preventDefault();
    var prep = this.props.prep;
    prep.notes = this.state.notes;
    this.props.updateNote(prep);
    this.setState({notes: null});
  },
  noteChanged: function(event) {
    this.setState({notes: event.target.value});
  },
  render: function() {
    var body;
    if(this.props.prep) {
      body = (
        <div>
          <h2>{this.props.prep.prep_type} Preparation:</h2>
          <p>{this.props.prep.question.contents}</p>
          <form onSubmit={this.noteSubmit}>
            <h3>Note:</h3>
            <h2>{this.props.prep.notes}</h2>
            <textarea onChange={this.noteChanged} name="notes"/>
            <input type="submit" value="Update Note" />
          </form>
        </div>
      )
    } else {
      body = <h2> select a prep on the left to edit </h2>
    }
    return(
      <div className="show-prep">
        {body}
      </div>
    )
  }
});

var ready = function () {
  ReactDOM.render(
    <Todo />,
    document.getElementById("todo")
  );
};

$(document).ready(ready);
