var preps = [
  {prep_type:"Home", question_contents: "Make sure your home is securely anchored to its foundation"},
  {prep_type:"Home", question_contents: "Bolt and brace heavy furniture to wall studs"},
  {prep_type:"Home", question_contents: "Identify location of gas shutoff and how to turn it off."}
]

var Todo = React.createClass({
  getInitialState: function() {
    return {preps: preps, currentPrep: null}
  },
  setCurrentTodo: function(prep) {
    this.setState({currentPrep: prep})
  },
  render: function() {
    return(
      <div>
        <PrepTypeList preps={this.state.preps}/>
      </div>
    );
  }
});

var PrepTypeList = React.createClass({
  render: function() {
    var prepDivs = [];

    for (var i = 0; i < this.props.preps.length; i++) {
      prepDivs.push(<PrepItem key={i} prep={this.props.preps[i]}/>)
    }

    return(
      <div className="prep-type-list">
        {prepDivs}
      </div>
    )
  }

});

var PrepItem = React.createClass({
  render: function() {
    return(
      <div>
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
