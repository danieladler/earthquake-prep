var preps = [
  {prep_type:"Home", question_contents: "Make sure your home is securely anchored to its foundation"},
  {prep_type:"Home", question_contents: "Bolt and brace heavy furniture to wall studs"},
  {prep_type:"Home", question_contents: "Identify location of gas shutoff and how to turn it off."}
]

var Todo = React.createClass({
  getInitialState: function() {
    return {preps: preps, currentPrep: null}
  },
  setCurrentPrep: function(prep) {
    this.setState({currentPrep: prep})
  },
  render: function() {
    return(
      <div>
        <PrepTypeList handleClick={this.setCurrentPrep} preps={this.state.preps}/>
        <ShowPrep prep={this.state.currentPrep}/>
      </div>
    );
  }
});

var ShowPrep = React.createClass({
  render: function() {
    var body;
    if(this.props.prep) {
      body = (
        <div>
          <h2>{this.props.prep.prep_type} Preparation:</h2>
          <h3>{this.props.prep.question_contents}</h3>
          <p>Notes:</p>
          <button>Complete & Save</button>
        </div>
      )
    } else {
      body = <h2> No Prep Selected </h2>
    }
    return(
      <div className="show-prep">
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
    return(
      <div onClick={this.showPrep} className="prep-item">
        <p>{this.props.prep.question_contents}</p>
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
