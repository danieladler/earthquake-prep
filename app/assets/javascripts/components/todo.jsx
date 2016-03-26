var Todo = React.createClass({
  getInitialState: function() {
    return {preps: [], dash: [], currentPrep: null}
  },
  componentDidMount: function() {
    var reactParent = this;
    $.ajax("/todo/preps").then(function(preps) {
      reactParent.setState({preps: preps});
    });
    $.ajax("todo/dash").then(function(dash){
      reactParent.setState({dash: dash});
    });
  },
  setCurrentPrep: function(prep) {
    this.setState({currentPrep: prep})
  },
  markComplete: function() {
    var reactParent = this;
    var cp = this.state.currentPrep;
    cp.completed = true;

    $.post("/todo/preps", {prep: cp}).then(function(prep) {
      var updatedPrepList = reactParent.state.preps;
      reactParent.setState({preps: updatedPrepList, currentPrep: null});
    });
  },
  render: function() {
    return(
      <div>
        <Dashboard dash={this.state.dash}/>
        <PrepList handleClick={this.setCurrentPrep} preps={this.state.preps}/>
        <ShowPrep prep={this.state.currentPrep} handleClick={this.markComplete}/>
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
        </div>
        <div id="completed-by-pct">
          <span id="all-preps-pct">{this.props.stat.all_preps}</span>%
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
      prepDivs.push(<PrepItem handleClick={this.props.handleClick} key={i} prep={this.props.preps[i]}/>)
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
          <p>{this.props.prep.question.contents}</p>
          <h3>Notes:</h3>
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
