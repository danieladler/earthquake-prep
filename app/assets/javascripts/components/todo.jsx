var preps = [
  {id:1, prep_type:"Home", question_contents: "Make sure your home is securely anchored to its foundation", complete: false},
  {id:2, prep_type:"Home", question_contents: "Bolt and brace heavy furniture to wall studs", complete: false},
  {id:3, prep_type:"Home", question_contents: "Identify location of gas shutoff and how to turn it off.", complete: true}
]

var Todo = React.createClass({
  getInitialState: function() {
    return {preps: preps, currentPrep: null}
  },
  setCurrentPrep: function(prep) {
    this.setState({currentPrep: prep})
  },
  markComplete: function() {
    var cp = this.state.currentPrep;
    var updatedPrepList = this.state.preps;
    cp["complete"] = true
    this.setState({preps: updatedPrepList, currentPrep: null});
  },

  render: function() {
    return(
      <div>
        <Dashboard />
        <PrepTypeList handleClick={this.setCurrentPrep} preps={this.state.preps}/>
        <ShowPrep prep={this.state.currentPrep} handleClick={this.markComplete}/>
      </div>
    );
  }
});

var Dashboard = React.createClass({
  render: function() {
    var body;
    body = <h1> dashboard here </h1>
    return(
      <div className="prep-dashboard">
        {body}
      </div>
    )
  }
});

var PrepTypeList = React.createClass({
  render: function() {
    var prepDivs = [];

    for (var i = 0; i < this.props.preps.length; i++) {
      prepDivs.push(<PrepItem handleClick={this.props.handleClick} key={i} prep={this.props.preps[i]}/>)
    }

    return(
      <div className="prep-type-list">
        {prepDivs}
      </div>
    )
  }
});

var PrepItem = React.createClass({
  showPrep: function() {
    this.props.handleClick(this.props.prep);
  },
  render: function() {
    var body;
    if (this.props.prep.complete) {
      body = <p className="crossed-out">{this.props.prep.question_contents}</p>
    } else {
      body = <p>{this.props.prep.question_contents}</p>
    }
    return(
      <div onClick={this.showPrep} className="prep-item">
        <input onClick={this.markComplete} type="checkbox" className="prep-check" type="hidden"></input>
        {body}
      </div>
    )
  }
});

var ShowPrep = React.createClass({
  markComplete: function() {
    this.props.handleClick(this.props.prep);
  },
  render: function() {
    var body;
    if(this.props.prep) {
      body = (
        <div>
          <h2>{this.props.prep.prep_type} Preparation:</h2>
          <h3>{this.props.prep.question_contents}</h3>
          <p>Notes:</p>
          <button onClick={this.markComplete}> Complete & Save </button>
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
