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
