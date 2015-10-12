# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      yr1
    FROM
      (
      SELECT
        yr AS yr1
      FROM
        nobels
      WHERE
        subject = 'Physics'
      GROUP BY yr1
      ) AS physics_years
    WHERE
      physics_years.yr1 NOT IN
      (
        SELECT
          yr AS yr2
        FROM
          nobels
        WHERE
          subject = 'Chemistry'
        GROUP BY
          yr2
      )

  SQL
end
