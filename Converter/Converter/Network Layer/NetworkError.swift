//
//  NetworkError.swift
//  Converter
//
//  Created by Aleksandr on 24.10.2022.
//

import Foundation

enum NetworkError: Error  {
    case incorrectUrl
    case internetError

    /*
     404    404_not_found    The requested resource does not exist.
     101    invalid_access_key    No API Key was specified or an invalid API Key was specified.
     103    invalid_api_function    The requested API endpoint does not exist.
     104    usage_limit_reached    The maximum allowed API amount of monthly API requests has been reached.
     105    function_access_restricted    The current subscription plan does not support this API endpoint.
     106    no_rates_available    The current request did not return any results.
     102    inactive_user    The account this API request is coming from is inactive.
     201    invalid_target_currency    An invalid target currency has been entered.
     202    invalid_currency_symbols    One or more invalid symbols have been specified.
     302    invalid_date    An invalid date has been specified. [historical, convert]
     403    invalid_conversion_amount    No or an invalid amount has been specified. [convert]
     501    no_timeframe_supplied    No or an invalid timeframe has been specified. [timeframe]
     502    invalid_start_date    No or an invalid "start_date" has been specified. [timeframe, change]
     503    invalid_end_date    No or an invalid "end_date" has been specified. [timeframe, change]
     504    invalid_time_frame    An invalid timeframe has been specified. [timeframe, change]
     505    time_frame_too_long    The specified timeframe is too long, exceeding 365 days. [timeframe, change]
     */
}
extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .incorrectUrl:
            return NSLocalizedString(
                "Uncorrect URL",
                comment: "bad url"
            )
        case .internetError:
            return NSLocalizedString(
                "Network connection error",
                comment: "badConnect"
            )
        }
    }
}
